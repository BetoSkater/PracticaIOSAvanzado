//
//  MapViewControllerLocationManagerDataSource.swift
//  PracticaIOSAvanzado
//
//  Created by Alberto Junquera Ramírez on 26/2/23.
//

import UIKit
import MapKit


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


