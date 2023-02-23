//
//  MapViewAnnotationView.swift
//  PracticaIOSAvanzado
//
//  Created by Alberto Junquera Ramírez on 23/2/23.
//

import MapKit

class MapViewAnnotationView: MKMarkerAnnotationView{
    
    override var annotation: MKAnnotation?{
        willSet {
            guard let value = newValue as? MapViewAnnotation else {return}
            
            detailCalloutAccessoryView = Callout(mapViewAnnotation: value)
            
            //TODO: Custom pin goes in here
            
           // let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
            
            
            
        }
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
    }
    
}
