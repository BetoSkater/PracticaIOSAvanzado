//
//  MapViewControllerDelegate.swift
//  PracticaIOSAvanzado
//
//  Created by Alberto Junquera Ramírez on 26/2/23.
//

import UIKit
import MapKit

//MARK: - MKMapViewDelegate -

extension MapViewController: MKMapViewDelegate{
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        let id = MKMapViewDefaultAnnotationViewReuseIdentifier
        
        let annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: id)
        
        if let annotation = annotation as? MapViewAnnotation{
            
            annotationView?.canShowCallout = true
            annotationView?.detailCalloutAccessoryView = Callout(mapViewAnnotation: annotation)
            
            return annotationView
        }
        return nil
    }
    //TODO: To show the detail view this does not work, this code shows the detail view without showing the annotation in the map.
    /*
     func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
     debugPrint("inside the didSelect method")
     
     let auxName = view.annotation?.title
     let auxDate = view.annotation?.subtitle
     let photo = "https://cdn.alfabetajuega.com/alfabetajuega/2020/12/freezer-dragon-ball-bebe-abj.jpg?width=300"
     
     
     let heroeModel = Heroe(id: "", name: "auxDate! ?? ", description: "desc", favorite: true, photo: photo)
     
     let heroeDetailVC = DetailViewController(heroeModel: heroeModel)
     
     self.present(heroeDetailVC, animated: true)
     }
     */
}

