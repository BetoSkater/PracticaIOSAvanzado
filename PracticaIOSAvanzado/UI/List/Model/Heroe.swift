//
//  Heroe.swift
//  PracticaIOSAvanzado
//
//  Created by Alberto Junquera Ramírez on 13/2/23.
//

import Foundation

//OJO, necesitamos dos clases Heroe, la de coreData, y esta que es la que se usa para decodificar el JSON
//TODO: fix, I created this just for testing the userInterfaces
//TODO: AS I understood in the last class, we add the data from the location to the hero before storing it in coreData, so we'll only have one coreData table. 
struct Heroe: Codable, Equatable {
    var id: String
    var name: String
    var description: String
    var favorite: Bool
    var photo: String
    //Note: all the values marked as optional are ignored in the decodifications, so the decoding error never happens
    var latitud: String?
    var locationID: String?
    var dateShow: String? //TODO: Check.
    var longitud: String?
   
}
