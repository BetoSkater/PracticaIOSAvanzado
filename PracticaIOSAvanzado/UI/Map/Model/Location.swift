//
//  Location.swift
//  PracticaIOSAvanzado
//
//  Created by Alberto Junquera Ramírez on 15/2/23.
//

import Foundation

struct Location:Codable{
    let latitud: String
    let dateShow: String
    let longitud: String
    let id: String
    let hero: Hero
    
    //D13A40E5-4418-4223-9CE6-D2F9A28EBE94
}

struct Hero: Codable{
    let id: String
}
