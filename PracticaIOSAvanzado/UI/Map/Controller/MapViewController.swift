//
//  MapViewController.swift
//  PracticaIOSAvanzado
//
//  Created by Alberto Junquera Ramírez on 13/2/23.
//

import UIKit
import CoreLocation
import MapKit

class MapViewController: BaseViewController{
    
     //MARK: - View Assigment -
    
    
    var mainView: MapView{self.view as! MapView}
    private var mapViewModel: MapViewModel?
    
    var locationManager: CLLocationManager?
    
    var heroesList: [Heroe] = []
    
    
     //MARK: - viewDidLoad and loadView -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Setting values:
        mapViewModel = MapViewModel()
        /*
         <key>NSLocationWhenInUseUsageDescription<\key>
        <string>This App needs your location<\string>
         */
        locationManager = CLLocationManager()
        locationManager?.requestWhenInUseAuthorization()
        locationManager?.delegate = self
        
        mainView.mapFrame.delegate = self
        mainView.mapFrame.mapType = .standard
        
        
        //Retrieven the data needed:
        retrieveHeroesFromCoreData()
        
    }
    
    override func loadView() {
        view = MapView()
    }
    
     //MARK: - Method to retrieve data from coreData -
    
    func retrieveHeroesFromCoreData(){
        mapViewModel?.coreDataRetrieveHeroes = { coreDataHeroes, coreDataIsEmpty in
           
            if let coreDataHeroes{
                self.heroesList = coreDataHeroes
                
                debugPrint("map view controller, heroes retrieved from coreData")
            }
        }
        mapViewModel?.retrieveHeroesFromCoreData()
    }
    
}
 //MARK: - CLLocationMaangerDelegate extension -
extension MapViewController: CLLocationManagerDelegate {
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        
        if #available(iOS 14.0, *){
            
            switch manager.authorizationStatus{
            case .notDetermined:
                debugPrint("Not determined yet.")
            case .restricted:
                debugPrint("Restricted")
            case .denied:
                debugPrint("Denied")
            case .authorizedAlways:
                debugPrint("Authorized always")
                
            case .authorizedWhenInUse:
                debugPrint("Authorized when un use")
                
            @unknown default:
                debugPrint("Unknow status")
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        switch manager.authorizationStatus {
        case .notDetermined:
            debugPrint("Not determined yet")
        case .restricted:
            debugPrint("Restricted")
        case .denied:
            debugPrint("Denied")
        case .authorizedAlways:
            debugPrint("Authorized always")
        case .authorizedWhenInUse:
            debugPrint("Authorized when in use")
        @unknown default:
            debugPrint("Unknow status")
        }
    }
}

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
    
    
}
