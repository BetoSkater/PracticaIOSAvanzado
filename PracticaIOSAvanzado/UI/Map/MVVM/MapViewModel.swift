//
//  MapViewModel.swift
//  PracticaIOSAvanzado
//
//  Created by Alberto Junquera Ramírez on 13/2/23.
//

import UIKit
import CoreData

class MapViewModel : NSObject{
    
    var context = AppDelegate.sharedAppDelegate.coreDataManager.managedContext
    
    var coreDataRetrieveHeroes: ((_ retrievedHerosFromCoreData: [Heroe]?, _ coreDataIsEmpty: Bool) -> Void)?
    
    var heroesList: [Heroe] = []
    
    //MARK: - Inits -
    
    override init() {
        
    }
    
    //MARK: - CoreData related methods -
    
    func retrieveHeroesFromCoreData() -> (){
        
        let fetchedHeroes: NSFetchRequest<HeroeCD> = HeroeCD.fetchRequest()
        
        do{
            let result = try context.fetch(fetchedHeroes)
            debugPrint("CoreData retrieved heroes in mapView: \(result)")
            
            if !result.isEmpty{
                let mappedResult = Tools().heroeCDToHeroeList(map: result)
                self.coreDataRetrieveHeroes?(mappedResult, false)
            }else{
                debugPrint("No data was retrieved from coreData in mapview")
                self.coreDataRetrieveHeroes?(nil, true)
            }
            
        } catch let error as NSError{
            debugPrint("CoreData retrieved heroes error in mapview: \(error)")
            
        }
    }
}
