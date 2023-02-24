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
    private var listViewModel: ListViewModel?
    private var listViewDataSource: ListViewDataSource?
    private var listViewDelegate: ListViewDelegate?
    
    
    
    
    var heroesList: [Heroe] = []
    
    //MARK: - No Inits Requiered-
 
    
    
    //MARK: - ViewDidLoad & loadView overrides -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listViewModel = ListViewModel()
        setTableComponents()
        setDidTapOnCell()
        //TODO: this way seems to be cooler  navigationItem.searchController
        setNavigationItemLogOutButton()
        
        
        checkIfUserIsAuthenticated()
        
        
        listViewModel?.dataRetrievedFromApiAndStoredInCoreData = {success in
            self.checkAndRetrieveHeroesFromCoreData()
        }
        
        checkAndRetrieveHeroesFromCoreData()
 
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
    
     //MARK: - setUpNavigationItemButton -
    
    func setNavigationItemLogOutButton(){
        navigationItem.title = "Heroes List"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Log Out", style: .plain, target: self, action: #selector(performLogOutTapped))
        navigationItem.rightBarButtonItem?.tintColor = .red
    }
    
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
    
     //MARK: - Log Out methods -
    
    @objc func performLogOutTapped(_ sender: UIBarButtonItem) -> Void{
        debugPrint("performLogOutTapped")
        
        listViewModel?.deletedTokenFromKeychainSuccesful = { success in
            token = ""
            self.viewDidLoad()
        }
        
        listViewModel?.deleteTokenFromKeychain()
    }
    
     //MARK: - Retrieving data related methods -
    private func checkAndRetrieveHeroesFromCoreData() {
        
         listViewModel?.coreDataRetrieveHeroes = { coreDataHeroes, coreDataIsEmpty in
           
                if let coreDataHeroes{
                    self.heroesList = coreDataHeroes
                    //TODO: Here goes a table view refresh.
                    self.listViewDataSource?.set(list: self.heroesList)
                    
                    self.heroesList.forEach { heroe in
                        debugPrint("\(heroe.name): \(heroe.id), \(heroe.favorite), \(heroe.photo), location, \(heroe.locationID),latitud:\(heroe.latitud), longitud: \(heroe.longitud), date: \(heroe.dateShow) ")
                    }
                    debugPrint("HeroesList has a size of: \(self.heroesList.count)")
                }else {
                    //TODO: Llamar al metodo que traiga los datos de la API
                    debugPrint("coreDataHeroes is empty")
                    Task{
                        await self.callApiAndStoreTheResultInCoreData()
                    }
                    //self.callApiAndStoreTheResultInCoreData()
                }
        }
        
       listViewModel?.retrieveHeroesFromCoreData()
    }
    //Method to call teh APICall
    
    private func callApiAndStoreTheResultInCoreData() async {
        self.listViewModel?.listViewDataRetrived = { retrievedHeroesSuccess in
            debugPrint("Heroe call worked")
        }
        self.listViewModel?.mapViewDataRetrieved = { locationsRetrievedSuccess in
            debugPrint("Location call worked")
        }
        /*
        Task {
           await  listViewModel?.retrieveHeroes()
        }
         */
        listViewModel?.retrieveHeroes()
    }
    
  //MARK: - TableView Related Methods -
    //set up method
    private func setTableComponents(){
        listViewDelegate = ListViewDelegate()
        listViewDataSource = ListViewDataSource(tableView: mainView.tableView)
        mainView.tableView.dataSource = listViewDataSource
        mainView.tableView.delegate = listViewDelegate
    }
    
    //didTapOnCell
    
    private func setDidTapOnCell(){
        listViewDelegate?.didTapOnCell = { [weak self] index in
            
            guard let dataSource = self?.listViewDataSource else {return}
            
            let heroeModel = dataSource.list[index]
            
            let heroeDetailVC = DetailViewController(heroeModel: heroeModel)
            
            self?.present(heroeDetailVC, animated: true)
            
        }
    }
    
    //load coreData info in the tableView
    
  
}
