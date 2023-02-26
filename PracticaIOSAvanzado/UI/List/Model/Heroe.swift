//
//  Heroe.swift
//  PracticaIOSAvanzado
//
//  Created by Alberto Junquera Ramírez on 13/2/23.
//

import Foundation

//Warning: Two heroe classes are needed. The coreData one and this one, which is used to decode the JSON and passing data to the table and map.

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
