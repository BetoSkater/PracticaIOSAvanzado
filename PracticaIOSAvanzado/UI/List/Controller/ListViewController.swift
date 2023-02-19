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
    var viewModel: ListViewModel?
    
     //MARK: - No inits needed -
    
     //MARK: - ViewDidLoad & loadView overrides -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = ListViewModel()
        logInTest()
        
        //locationsTest()
    }
    
    override func loadView() {
        view = ListView()
    }
    
     //MARK: - LogInTest -
    
    func logInTest(){
     
        
        self.viewModel?.loginTransitionSuccessfull = {userLogged in
            //TODO: El dismis va aqui.
            
            debugPrint("LogIn API call is successfull. It goes all the way to the dismiss screen. Check that the token is saved.")
            self.heroesTest()
        }
        
    }
    
    func heroesTest(){
        viewModel?.retrieveHeroes()
        
        self.viewModel?.listViewDataRetrived = { retrievedHeroesSuccess in
            debugPrint("Heroe call worked")
        }
        
        self.viewModel?.mapViewDataRetrieved = { locationsRetrievedSuccess in
            debugPrint("Location call worked")
        }
    }
    
    func locationsTest(){
       // D13A40E5-4418-4223-9CE6-D2F9A28EBE94
        
       let heroe = Heroe(id: "D13A40E5-4418-4223-9CE6-D2F9A28EBE94", name: "prueba", description: "prueba", favorite: true, photo: "photo prueba")
        
        viewModel?.retrieveLocations(for: heroe)
        
        self.viewModel?.mapViewDataRetrieved = { locationsRetrievedSuccess in
            debugPrint("Location call worked")
        }
        
    }
}
