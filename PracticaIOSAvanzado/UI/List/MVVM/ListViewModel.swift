//
//  ListViewModel.swift
//  PracticaIOSAvanzado
//
//  Created by Alberto Junquera Ramírez on 13/2/23.
//

import UIKit

class ListViewModel : NSObject{
    
    override init() {
        
    }
    //TODO: move to loginViewModel when it is done
    //TEsting that all the apiCalls work:
     //MARK: - Login -
    
    //var loginTransitionSuccessfull: ((_ userIsLogged: Bool) ->Void)?
    var tokenRetrievedFromKeychain: ((_ tokenRetrieved: String) -> Void)?
   
    
    var listViewDataRetrived: ((_ isHeroesInfoRetrieved: Bool) -> Void)?
    var mapViewDataRetrieved: ((_ isLocationInfoRetrived: Bool) -> Void)?
    
    var token: String? //TODO: remove this token, retrieve it from keychain in each func
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
        //TODO: Retrieve token, I think that I must retrieve the token in here.
        //ApiCall
      
        if let token{
            NetworkLayer.shared.getHeroes(token: token) {[weak self] retrievedHeroes, error in
                if let retrievedHeroes{
          
                   self?.listViewDataRetrived?(true)
                  
                    retrievedHeroes.forEach { heroe in
                        self?.retrieveLocations(for: heroe)
                    }
                }
            }
        }//if let token
    }
    
    //TODO: - Move location to mapviewModel
    
    func retrieveLocations(for heroe: Heroe ) -> (){

        if let token{
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
                        debugPrint("\(self?.heroesList.count)")
                    }
                }
            }
        }//if let token
    }
    
    
    func retrieveTokenFromKeychain(){
        
        let token = KeychainManager.shared.retrieveToken()
        
 
            self.tokenRetrievedFromKeychain?(token)
        
         
        
    }
}
