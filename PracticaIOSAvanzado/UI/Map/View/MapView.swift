//
//  MapView.swift
//  PracticaIOSAvanzado
//
//  Created by Alberto Junquera Ramírez on 13/2/23.
//

import UIKit
import MapKit

class MapView : UIView{
    
    let mapFrame = {
        
        let map = MKMapView()
        
        map.translatesAutoresizingMaskIntoConstraints = false
        
        return map
        
    }()
    
    //MARK: - Inits -
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Set Up View -
    
    func setUpView(){
        backgroundColor = UIColor(named: ResourceName.gokuOrange.rawValue)
        
        addSubview(mapFrame)
        
        NSLayoutConstraint.activate([
            
            mapFrame.topAnchor.constraint(equalTo: topAnchor, constant: 100),
            mapFrame.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 10),
            mapFrame.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            mapFrame.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -100)
            
        ])
    }
}
