//
//  ListViewModel.swift
//  PracticaIOSAvanzado
//
//  Created by Alberto Junquera Ramírez on 13/2/23.
//

import UIKit
import CoreData

class ListViewModel : NSObject{
    
    var context = AppDelegate.sharedAppDelegate.coreDataManager.managedContext
    
    //MARK: - Init -
    override init() {
        
    }
    //MARK: - Retrieving data from the API methods -
    
    
    var tokenRetrievedFromKeychain: ((_ tokenRetrieved: String) -> Void)?
    var listViewDataRetrived: ((_ isHeroesInfoRetrieved: Bool) -> Void)?
    var mapViewDataRetrieved: ((_ isLocationInfoRetrived: Bool) -> Void)?
    var dataRetrievedFromApiAndStoredInCoreData: ((_ succesful: Bool) -> Void)?
    var coreDataRetrieveHeroes: ((_ retrievedHerosFromCoreData: [Heroe]?, _ coreDataIsEmpty: Bool) -> Void)?
    var deletedTokenFromKeychainSuccesful: ((_ succesfull: Bool) -> Void)?
    
    var heroesList: [Heroe] = []
    
    func retrieveHeroes(){
        //ApiCall
        //var completeHeroesList: [Heroe] = []
       // let group = DispatchGroup()
        
        if !token.isEmpty{
           // group.enter()
            NetworkLayer.shared.getHeroes(token: token) {[weak self] retrievedHeroes, error in
                if let retrievedHeroes{
                    
                    let range = retrievedHeroes.count
                    self?.listViewDataRetrived?(true)
                    
                    for (index, heroe) in retrievedHeroes.enumerated(){
                        self?.retrieveLocations(for: heroe)
                        //TODO: notification center
                        if index == retrievedHeroes.count - 1{
                           // group.leave()
                            self?.dataRetrievedFromApiAndStoredInCoreData?(true)
                        }
                    }
                }
            }
        }//if  token
       // group.wait()
        //group.notify(queue: .main){
        //    self.dataRetrievedFromApiAndStoredInCoreData?(true)
        //}
    }
    
    func retrieveLocations(for heroe: Heroe) -> (){
        if !token.isEmpty{
            
            NetworkLayer.shared.getLocations(token: token, heroId: heroe.id) { [weak self] allLocations, error in
                if let allLocations {
                    self?.mapViewDataRetrieved?(true)
                    guard let location = allLocations.first else {
                        debugPrint("Location is nil")
                        return
                    }
                    
                    debugPrint("It seems location call work")
                    //TODO: try to do this with a map
                    let id = heroe.id
                    let name = heroe.name
                    let desc = heroe.description
                    let isFav = heroe.favorite
                    let photo = heroe.photo
                    let locationID = location.id
                    let date = location.dateShow
                    let latitud = location.latitud
                    let longitud = location.longitud
                    
                    let heroToAdd = Heroe(id: id,
                                          name: name,
                                          description: desc,
                                          favorite: isFav,
                                          photo: photo,
                                          latitud: latitud,
                                          locationID: locationID,
                                          dateShow: date,
                                          longitud: longitud)
                    
                    DispatchQueue.main.async {
                        self?.heroesList.append(heroToAdd)
                        self?.mapViewDataRetrieved?(true)
                        
                        debugPrint("Heroes in coreData: \(self?.heroesList.count)")
                        self?.saveHero(saving: heroToAdd)
                        
                    }
                }
            }
        }//if let token
    }
    
    //MARK: - Keychain related methods -
    
    func retrieveTokenFromKeychain(){
        
        let token = KeychainManager.shared.retrieveToken()
        self.tokenRetrievedFromKeychain?(token)
        
    }
    
    func deleteTokenFromKeychain(){
        
        let tokenHasBeenDeleted = KeychainManager.shared.deletetoken()
        if tokenHasBeenDeleted{
            self.deletedTokenFromKeychainSuccesful?(tokenHasBeenDeleted)
        }
    }
    
    //MARK: - CoreData -
    
    func saveHero(saving heroe: Heroe){
        
        let heroeToStore = HeroeCD(context: context)
        
        let heroeIdUUID = UUID(uuidString: heroe.id)
        let heroeDate = Tools().stringToDate(this: heroe.dateShow!)
        //TODO: Try to do this with a map.
        heroeToStore.id = heroeIdUUID
        heroeToStore.name = heroe.name
        heroeToStore.desc = heroe.description
        heroeToStore.favorite = heroe.favorite
        heroeToStore.photo = heroe.photo
        heroeToStore.locationID = heroe.locationID
        heroeToStore.longitud = heroe.longitud
        heroeToStore.latitud = heroe.latitud
        heroeToStore.dateShow = heroeDate
        
        do{
            try context.save()
            debugPrint("CoreData saved the heroe")
        }catch let error{
            debugPrint("CoreData Error: Saving heroes failed.")
        }
    }
    
    func retrieveHeroesFromCoreData() -> (){
        
        let fetchedHeroes: NSFetchRequest<HeroeCD> = HeroeCD.fetchRequest()
        
        do{
            let result = try context.fetch(fetchedHeroes)
            debugPrint("CoreData retrieved heroes: \(result)")
            
            if !result.isEmpty{
                let mappedResult = Tools().heroeCDToHeroeList(map: result)
                //TODO: Call cloasure in here to pass the result. Mapear.
                self.coreDataRetrieveHeroes?(mappedResult, false)
            }else{
                debugPrint("No data was retrieved from coreData")
                self.coreDataRetrieveHeroes?(nil, true)
            }
            
        } catch let error as NSError{
            debugPrint("CoreData retrieved heroes: \(error)")
            
        }
    }
}
