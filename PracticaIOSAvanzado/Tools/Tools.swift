//
//  Tools.swift
//  PracticaIOSAvanzado
//
//  Created by Alberto Junquera Ramírez on 20/2/23.
//

import Foundation

class Tools {
    
     //MARK: - Formatters -
 
    func stringToDate(this date: String) -> Date{
         
        let dateFormatter = DateFormatter()
        //"2022-09-11T00:00:00Z"
       // dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        
        guard let date = dateFormatter.date(from: date) else {
            debugPrint("Date Formatter Error: Formatting failed.")
            return Date.now
        } //TODO: OJO que puede petar aqui.
   
        return date
    }
  
    //MARK: - Maps -
    
    //Map from HeroeCD to Heroe:
 
    func heroeCDToHeroeList(map heroes:[HeroeCD]) -> [Heroe] {
        var convertedHeroes: [Heroe] = []
        
        heroes.map { heroe in
            convertedHeroes.append(heroeCDToHeroe(this: heroe))
        }
        
    
        return convertedHeroes
    }

    func heroeCDToHeroe(this heroe: HeroeCD) -> Heroe {
        
    
        let id = heroe.id?.uuidString
        let dateString = heroe.dateShow?.formatted()
        
        let convertedHero = Heroe(id: id!, name: heroe.name!, description: heroe.desc! , favorite: heroe.favorite, photo: heroe.photo!, latitud: heroe.latitud!, locationID: heroe.locationID!, dateShow: dateString!, longitud: heroe.longitud!)
        
        return convertedHero
        
    }
   
    
    
}
