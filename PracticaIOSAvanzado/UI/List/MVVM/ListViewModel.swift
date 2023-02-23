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
    
    override init() {
        
    }
    //TODO: move to loginViewModel when it is done
    //TEsting that all the apiCalls work:
     //MARK: - Login -
    
    //var loginTransitionSuccessfull: ((_ userIsLogged: Bool) ->Void)?
    var tokenRetrievedFromKeychain: ((_ tokenRetrieved: String) -> Void)?
   
    var listViewDataRetrived: ((_ isHeroesInfoRetrieved: Bool) -> Void)?
    var mapViewDataRetrieved: ((_ isLocationInfoRetrived: Bool) -> Void)?
    var dataRetrievedFromApiAndStoredInCoreData: ((_ succesful: Bool) -> Void)?
    
    var coreDataRetrieveHeroes: ((_ retrievedHerosFromCoreData: [Heroe]?, _ coreDataIsEmpty: Bool) -> Void)?
    
    
   // var token: String? //TODO: remove this token, retrieve it from keychain in each func
    var heroesList: [Heroe] = []
    /*
    func logIn(with email: String, and password: String) -> (){
        
        //Api call:
        
        NetworkLayer.shared.getToken(email: email, password: password) { token, error in
            if let token {
                //TODO: SAving token in Keychain missing
                
                debugPrint("Login Token: --> \(token)")
                self.token = token //TODO: Remove this self.token = token
                DispatchQueue.main.async {
                    self.loginTransitionSuccessfull?(true) //TODO: Check the ?.
                }
            }
        }
    }
    */
     //TODO: - Move to heroes List viewModel, so here-
    
    func retrieveHeroes(){
        //ApiCall
      
        if !token.isEmpty{
            NetworkLayer.shared.getHeroes(token: token) {[weak self] retrievedHeroes, error in
                if let retrievedHeroes{
          
                    self?.listViewDataRetrived?(true)
                  
                    retrievedHeroes.forEach { heroe in
                        self?.retrieveLocations(for: heroe)
                        if heroe == retrievedHeroes.last{
                            //TODO: check if this work here
                            self?.dataRetrievedFromApiAndStoredInCoreData?(true)
                        }
                    }
                }
            }
        }//if  token
    }
    

    func retrieveLocations(for heroe: Heroe ) -> (){

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
    
    
    func retrieveTokenFromKeychain(){
        
        let token = KeychainManager.shared.retrieveToken()
        self.tokenRetrievedFromKeychain?(token)
        
    }
    
     //MARK: - CoreData -
    
     func saveHero(saving heroe: Heroe){
         
        let heroeToStore = HeroeCD(context: context)
        
        let heroeIdUUID = UUID(uuidString: heroe.id)
        let heroeDate = Tools().stringToDate(this: heroe.dateShow!)
        //"2022-09-11T00:00:00Z"
        
        heroeToStore.id = heroeIdUUID //as! UUID
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
