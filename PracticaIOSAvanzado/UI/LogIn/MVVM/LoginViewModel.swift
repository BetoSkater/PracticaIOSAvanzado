//
//  LoginViewModel.swift
//  PracticaIOSAvanzado
//
//  Created by Alberto Junquera Ramírez on 10/2/23.
//

import UIKit

class LoginViewModel: NSObject{
    
    override init() {
        
    }
    
    var loginTransitionSuccessfull: ((_ userIsLogged: Bool) ->Void)?
    var tokenRetrievedFromKeychain: ((_ tokenRetrieved: String) -> Void)?
    //Token
    
    func logIn(with email: String, and password: String) -> (){
        
        //Api call:
        NetworkLayer.shared.getToken(email: email, password: password) { token, error in
            if let token {
             
                debugPrint("Login Token: --> \(token)")
                //self.token = token //TODO: Remove this self.token = token
                DispatchQueue.main.async {
                    //TODO: SAving token in Keychain missing
                    self.storeTokenAfterLogIn(this: token)
                    self.loginTransitionSuccessfull?(true) //TODO: Check the ?.
                }
            }
        }
    }
    
    func storeTokenAfterLogIn(this token: String){
        
        KeychainManager.shared.storeToken(this: token)
    }
    
    
    
}
