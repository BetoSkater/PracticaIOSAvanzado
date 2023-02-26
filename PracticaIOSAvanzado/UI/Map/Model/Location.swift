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
    
}
// This struct is needed in order to decode the hero id:
struct Hero: Codable{
    let id: String
}
