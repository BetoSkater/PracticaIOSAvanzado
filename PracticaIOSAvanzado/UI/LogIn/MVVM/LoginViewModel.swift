//
//  LoginViewModel.swift
//  PracticaIOSAvanzado
//
//  Created by Alberto Junquera Ramírez on 10/2/23.
//

import UIKit

class LoginViewModel: NSObject{
    
    var loginTransitionSuccessfull: ((_ userIsLogged: Bool) ->Void)?
    var tokenRetrievedFromKeychain: ((_ tokenRetrieved: String) -> Void)?
    
    //MARK: - Init -
    override init() {
        
    }
    //MARK: - Login method -
    
    func logIn(with email: String, and password: String) -> (){
        //Api call:
        NetworkLayer.shared.getToken(email: email, password: password) { token, error in
            if let token {
                
                debugPrint("Login Token: --> \(token)")
                
                DispatchQueue.main.async {
                    
                    self.storeTokenAfterLogIn(this: token)
                    self.loginTransitionSuccessfull?(true)
                }
            }
        }
    }
    
    //MARK: - Keychain methods -
    func storeTokenAfterLogIn(this token: String){
        KeychainManager.shared.storeToken(this: token)
    }
}
