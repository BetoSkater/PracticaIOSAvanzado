//
//  ListViewController.swift
//  PracticaIOSAvanzado
//
//  Created by Alberto Junquera Ramírez on 13/2/23.
//

import UIKit

class ListViewController: BaseViewController{
    //TODO:
    /*
     let employeeCoreData = employeeAPI.map { employee in
     //mapeo enplouyeeApi a employeeDB
     //devolverlo de employeeDB
     
     return employeeDB
     }
     */
    //MARK: - View Assigment -
    
    var mainView: ListView{self.view as! ListView}
    var listViewModel: ListViewModel?
    
    var heroesList: [Heroe] = []
    
    //MARK: - No inits needed -
    
    //MARK: - ViewDidLoad & loadView overrides -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listViewModel = ListViewModel()
        
        checkIfUserIsAuthenticated()
        
        
        listViewModel?.dataRetrievedFromApiAndStoredInCoreData = {success in
            self.checkAndRetrieveHeroesFromCoreData()
        }
        
        checkAndRetrieveHeroesFromCoreData()
        
        
        //logInTest()
        //locationsTest()
    }
    
    override func loadView() {
        view = ListView()
    }
    
    //MARK: - LogInTest -
 /*
   private func heroesTest(){
        listViewModel?.retrieveHeroes()
        self.listViewModel?.listViewDataRetrived = { retrievedHeroesSuccess in
            debugPrint("Heroe call worked")
        }
        self.listViewModel?.mapViewDataRetrieved = { locationsRetrievedSuccess in
            debugPrint("Location call worked")
        }
    }
    //MARK: - Checking ig the location call works, remove -
   private func locationsTest(){
        let heroe = Heroe(id: "D13A40E5-4418-4223-9CE6-D2F9A28EBE94", name: "prueba", description: "prueba", favorite: true, photo: "photo prueba")
        
        listViewModel?.retrieveLocations(for: heroe)
        
        self.listViewModel?.mapViewDataRetrieved = { locationsRetrievedSuccess in
            debugPrint("Location call worked")
        }
    }
    */
    //MARK: - Authentication related methods -
    
    private func retrieveTokenFromKeychain() -> String {
        
       // var token: String = ""
        
        self.listViewModel?.tokenRetrievedFromKeychain = { retrievedToken in
            token = retrievedToken
            debugPrint("inside the tokenRetrievedFromKeychain method")
        }
        self.listViewModel?.retrieveTokenFromKeychain()
    
        return token
    }
    
   private func checkIfUserIsAuthenticated() -> Void{
        
       let value = retrieveTokenFromKeychain()
       DispatchQueue.main.async {
           if value.isEmpty{
               
               let loginViewController = LoginViewController()
               loginViewController.modalPresentationStyle = .fullScreen
               
               self.navigationController?.present(loginViewController, animated: true)
           }
       }
    }
    
    private func checkAndRetrieveHeroesFromCoreData(){
        
        listViewModel?.coreDataRetrieveHeroes = { coreDataHeroes, coreDataIsEmpty in
           
                if let coreDataHeroes{
                    self.heroesList = coreDataHeroes
                    //TODO: Here goes a table view refresh.
                    self.heroesList.forEach { heroe in
                        debugPrint("\(heroe.name): \(heroe.id), \(heroe.favorite), \(heroe.photo), location, \(heroe.locationID),latitud:\(heroe.latitud), longitud: \(heroe.longitud), date: \(heroe.dateShow) ")
                    }
                    debugPrint("HeroesList has a size of: \(self.heroesList.count)")
                }else {
                    //TODO: Llamar al metodo que traiga los datos de la API
                    debugPrint("coreDataHeroes is empty")
                    
                        self.callApiAndStoreTheResultInCoreData()
                }
            
            
            
            
        }
        listViewModel?.retrieveHeroesFromCoreData()
    }
    //Method to call teh APICall
    
    private func callApiAndStoreTheResultInCoreData(){
        self.listViewModel?.listViewDataRetrived = { retrievedHeroesSuccess in
            debugPrint("Heroe call worked")
        }
        self.listViewModel?.mapViewDataRetrieved = { locationsRetrievedSuccess in
            debugPrint("Location call worked")
        }
        
        listViewModel?.retrieveHeroes(using: token)
        
    }
}
