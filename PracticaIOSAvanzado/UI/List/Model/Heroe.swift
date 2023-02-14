//
//  Heroe.swift
//  PracticaIOSAvanzado
//
//  Created by Alberto Junquera Ramírez on 13/2/23.
//

import Foundation

//OJO, necesitamos dos clases Heroe, la de coreData, y esta que es la que se usa para decodificar el JSON
//TODO: fix, I created this just for testing the userInterfaces
struct Heroe {
    var heroeID: String
    var name: String
    var description: String
    var isFav: Bool
    var image: String
}
