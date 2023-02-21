//
//  Heroes+CoreDataClass.swift
//  PracticaIOSAvanzado
//
//  Created by Alberto Junquera Ramírez on 20/2/23.
//

import Foundation
import CoreData

@objc(HeroeCD)
public class HeroeCD: NSManagedObject{
    
}

public extension HeroeCD{
    
    @nonobjc class func fetchRequest() -> NSFetchRequest<HeroeCD> {
        return NSFetchRequest<HeroeCD>(entityName: "HeroeCD")
    }
    
    @NSManaged var id: UUID?
    @NSManaged var dateShow: Date?
    @NSManaged var favorite: Bool //optional bool is not acepted by objc
    @NSManaged var photo: String?
    @NSManaged var name: String?
    @NSManaged var longitud: String?
    @NSManaged var locationID: String?
    @NSManaged var latitud: String?
    @NSManaged var desc: String?
}

extension HeroeCD: Identifiable{}
