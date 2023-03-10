//
//  APIEnums.swift
//  PracticaIOSAvanzado
//
//  Created by Alberto Junquera Ramírez on 14/2/23.
//

import Foundation

enum APIEndPoint: String{
    case baseURL = "https://dragonball.keepcoding.education"
    case loginEP = "/api/auth/login"
    case heroesEP = "/api/heros/all"
    case heroLocationsEP = "/api/heros/locations"
}

enum APIMethod: String{
    
    case GET = "GET"
    case POST = "POST"
    
}

enum MiscValues:String{
    case basic = "Basic "
    case bearer = "Bearer "
    case authorization = "Authorization"
    case name = "name"
    case emptyString = ""
    case id = "id"
    case token = "token"
}

enum NetworkError: Error{
    case malformedURL
    case noData
    case statusCode(code: Int?)
    case decodingFailed
    case unknown
    case missingToken
}
