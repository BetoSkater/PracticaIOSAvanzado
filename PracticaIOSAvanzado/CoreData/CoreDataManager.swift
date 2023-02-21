//
//  CoreDataManager.swift
//  PracticaIOSAvanzado
//
//  Created by Alberto Junquera Ramírez on 20/2/23.
//

import CoreData

class CoreDataManager{
    
    private let modelName:String
    
    init(modelName: String) {
        self.modelName = modelName
    }
    
     //MARK: - StoreContainer -
    
    private lazy var storeContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: self.modelName)
        container.loadPersistentStores { _, error in
            if let error{
                debugPrint("CoreData Error: Error at loading persisnte stores: \(error)")
            }
        }
        return container
    }()
    lazy var managedContext: NSManagedObjectContext = self.storeContainer.viewContext
    
    
    //MARK: - saveContext() -
    
    func saveContext(){
        guard managedContext.hasChanges else {return}
        
        do{
            try managedContext.save()
        }catch let error as NSError{
            debugPrint("CoreData Error: Error at saving the context \(error)")
        }

    }
}
