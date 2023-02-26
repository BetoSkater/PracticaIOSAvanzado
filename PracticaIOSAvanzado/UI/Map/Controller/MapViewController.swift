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
        
        locationManager = CLLocationManager()
        locationManager?.requestWhenInUseAuthorization()
        locationManager?.delegate = self
        
        mainView.mapFrame.delegate = self
        mainView.mapFrame.mapType = .standard
        
        navigationItem.title = TextString.secondTabBarTitle.rawValue
        
        //Retring the data needed:
        retrieveHeroesFromCoreData()
        
        //Setting annotations
        mainView.mapFrame.register(MapViewAnnotationView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        
        let annotations = heroesList.map {MapViewAnnotation(heroe: $0)}
        
        mainView.mapFrame.showAnnotations(annotations, animated: true)
        
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
    
    //MARK: - Anotation Methods -
    
    func createHeroeAnnotation(with heroe: Heroe){
        let annotation = MKPointAnnotation()
        
        let latitud = Tools.shared.fromOptionalStringToDouble(this: heroe.latitud)
        let longitud = Tools.shared.fromOptionalStringToDouble(this: heroe.longitud)
        
        
        annotation.coordinate = CLLocationCoordinate2D(latitude: latitud, longitude: longitud)
        annotation.title = heroe.name
        annotation.subtitle = heroe.dateShow
        
        mainView.mapFrame.addAnnotation(annotation)
    }
    
    func createAnnotations(from heroes: [Heroe]){
        heroes.forEach(createHeroeAnnotation)
    }
    
}

