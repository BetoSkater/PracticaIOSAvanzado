//
//  NetworkLayer.swift
//  PracticaIOSAvanzado
//
//  Created by Alberto Junquera Ramírez on 14/2/23.
//

import Foundation
/*
//Ejemplo llamada, borrar.
NetworkLayer.shared.getData<Heroe>(endPoint: .heroesEP, token: "asasas") { [Heroe], error in
    
}
*/
final class NetworkLayer{
    
    static let shared = NetworkLayer()
    
    //MARK: - Generic Call for all the cases -
    //Meter un parametro enum para identificar el tipo de consulta que se va a llevar a cabo.
    func getToken(email: String, password: String ,completion: @escaping (String?, Error?) -> ()){
        //Generating URL
        guard let url = URL(string: APIEndPoint.baseURL.rawValue + APIEndPoint.loginEP.rawValue) else {
            completion(nil, NetworkError.malformedURL)
            return
        }
        //Encoding the credentials:
        let loginString = "\(email):\(password)"
        let loginData: Data = loginString.data(using: .utf8)!
        let base64 = loginData.base64EncodedData()
        
        //Access mode:
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = APIMethod.POST.rawValue
        urlRequest.setValue("\(MiscValues.bearer.rawValue)\(base64)", forHTTPHeaderField: MiscValues.authorization.rawValue)
        
        //Task:
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard error == nil else{
                completion(nil, error)
                return
            }
            
            guard let data else{
                completion(nil,NetworkError.noData)
                return
            }
            
            guard (response as? HTTPURLResponse)?.statusCode == 200 else{
                let statusCode = (response as? HTTPURLResponse)?.statusCode
                completion(nil, NetworkError.statusCode(code: statusCode))
                return
            }
            
            guard let token = String(data: data, encoding: .utf8) else{
                completion(nil, NetworkError.decodingFailed)
                return
            }
            
            completion(token,nil)
        }
        task.resume()
    }
   
    //TODO: he de hacer dos, una para el login y otra para los metodos get.
    
   
    
    
    func getData<T:Decodable>(endPoint: APIEndPoint, token:String?, heroID: String?, completion: @escaping ([T]?, Error?) ->()){
        //TODO: si en la closure tengo T, cuando llame al metodo tengo que poner getData<[Heroe]>, si tengo [T], con llamarla como getData<Hero> creo que valdría.
        
        
        //Unpackaging the token (all the uses of this function need a token)
        guard let token else{
            completion(nil,NetworkError.missingToken)
            return
        }
        
        //UrlGeneration
        
        guard let url = URL(string: APIEndPoint.baseURL.rawValue + endPoint.rawValue) else {
            completion(nil, NetworkError.malformedURL)
            return
        }
        
        //Query:
        
        var urlComponents = URLComponents()
        switch(endPoint){
        case .heroesEP:
            urlComponents.queryItems = [URLQueryItem(name: MiscValues.name.rawValue, value: MiscValues.emptyString.rawValue)]
            
        case .heroLocationsEP:
            if let heroID{
                urlComponents.queryItems = [URLQueryItem(name: MiscValues.id.rawValue, value: heroID)]
            }
        default: break
        }
        
        //Access Petition
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = APIMethod.POST.rawValue
        urlRequest.setValue(MiscValues.bearer.rawValue + token, forHTTPHeaderField: MiscValues.authorization.rawValue)
        urlRequest.httpBody = urlComponents.query?.data(using: .utf8)
        
        //Task
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard error == nil else {
                completion(nil, error)
                return
            }
            
            //In postman, good responses for retrieven all the heroes and all the locations of a hero gives a status code 200 back.
            
            guard (response as? HTTPURLResponse)?.statusCode == 200 else{
                let statusCode = (response as? HTTPURLResponse)?.statusCode
                completion(nil, NetworkError.statusCode(code: statusCode))
                return
            }
            
            guard let data else{
                completion(nil, NetworkError.noData)
                return
            }
            
            guard let result = try? JSONDecoder().decode([T].self, from: data)else{
                completion(nil, NetworkError.decodingFailed)
                return
            }
            
            completion(result, nil)
        }
        task.resume()
        
        
    }
//Log: func login(email: String, password: String, completion: @escaping (String?, Error?) -> ()){
    
//her: func retrieveHeroes(token: String?, completion: @escaping([Heroe]?, Error?)->()){

//tra:func retrieveTransformations(token: String?, heroId: String?, completion: @escaping ([Transformation]?, Error?) -> ()){
    
//fav:func setFavourite(token: String?, heroId: String?, completion: @escaping (HTTPURLResponse?, Error?)->() ){
}
