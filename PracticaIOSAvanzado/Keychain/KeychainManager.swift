//
//  KeychainManager.swift
//  PracticaIOSAvanzado
//
//  Created by Alberto Junquera Ramírez on 19/2/23.
//

import Foundation
import Security

class KeychainManager{
    
    static let shared = KeychainManager()
    
    //MARK: - Keychain management methods -
    
    func storeToken(this token: String){
        //Token encoding:
        let encodedToken = token.data(using: .utf8)!
        
        //Attribute preparation:
        
        let attributes: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: MiscValues.token.rawValue,
            kSecValueData as String: encodedToken
        ]
        
        //Storing the information:
        
        if SecItemAdd(attributes as CFDictionary, nil) == noErr{
            debugPrint("The token was stored succesfully!")
        }else{
            debugPrint("There was an error while trying to store the token.")
        }
    }
    
    //Method to retrieve the token:
    
    func retrieveToken() -> String{
        var token = ""
        //Query:
        let query: [String: Any] = [
            
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: MiscValues.token.rawValue,
            kSecMatchLimit as String: kSecMatchLimitOne,
            kSecReturnAttributes as String: true,
            kSecReturnData as String: true
            
        ]
        
        var item: CFTypeRef?
        
        if SecItemCopyMatching(query as CFDictionary, &item) == noErr{
            //Extracting info:
            if let existingItem = item as? [String: Any],
               let tokenToRetrieve = existingItem[kSecAttrAccount as String] as? String,
               let tokenData = existingItem[kSecValueData as String] as? Data,
               let tokenDecoded = String(data: tokenData, encoding: .utf8){
                
                
                token = tokenDecoded
                debugPrint("Token value is \(token)")
                
            }else{
                debugPrint("There wasa problem while fetching the token from keychain")
            }
        }
        return token
    }
    
    
    //MARK: - Delete token -
    
    func deletetoken() -> Bool{
        
        //Query
        
        let query: [String:Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: MiscValues.token.rawValue
        ]
        
        //Execute query:
        
        if (SecItemDelete(query as CFDictionary)) == noErr{
            debugPrint("Deleted token")
            return true
        }else{
            debugPrint("There was an error while deleting the token")
            return false
        }
    }
    
}
