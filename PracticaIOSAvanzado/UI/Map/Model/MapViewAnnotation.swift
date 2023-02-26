//
//  MapViewAnnotation.swift
//  PracticaIOSAvanzado
//
//  Created by Alberto Junquera Ramírez on 23/2/23.
//

import UIKit
import MapKit

class MapViewAnnotation: NSObject, MKAnnotation {
    
    let coordinate: CLLocationCoordinate2D
    let heroeName: String
    let heroeImage: String
    let heroeDate: String
    
    init(heroe: Heroe) {
        
        let latitude = Tools.shared.fromOptionalStringToDouble(this: heroe.latitud)
        let longitude = Tools.shared.fromOptionalStringToDouble(this: heroe.longitud)
        
        coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        heroeName = heroe.name
        heroeImage = heroe.photo
        heroeDate = heroe.dateShow!
    }
}
