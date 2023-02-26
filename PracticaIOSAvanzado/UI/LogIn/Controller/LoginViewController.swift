//
//  LoginViewController.swift
//  PracticaIOSAvanzado
//
//  Created by Alberto Junquera Ramírez on 10/2/23.
//

import UIKit

class LoginViewController: BaseViewController{
    
    //MARK: - View Assignment -
    
    var mainView: LoginView{self.view as! LoginView}
    var loginViewModel: LoginViewModel?
    var delegate: UserTokenHasBeenSavedDelegate?
    
    //MARK: - viewDidLoad and loadView overrrides -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginViewModel = LoginViewModel()
        
        
        mainView.loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        
    }
    
    override func loadView() {
        view = LoginView()
    }
    
    //MARK: - Button methods -
    
    @objc func loginButtonTapped(sender: UIButton!){
        performLogIn()
    }
    
    //MARK: - performLoginMethod -
    
    func performLogIn(){
        //Retrieving login info:
        if !mainView.emailTextField.text!.isEmpty && !mainView.passTextField.text!.isEmpty{
            
            let email = mainView.emailTextField.text!
            let password = mainView.passTextField.text!
            
            loginViewModel?.logIn(with: email, and: password)
            
            self.loginViewModel?.loginTransitionSuccessfull = {userLogged in
                
                debugPrint("LogIn API call is successfull. It goes all the way to the dismiss screen. Check that the token is saved.")
               
                if self.delegate != nil{
                    self.dismiss(animated: true)
                    self.delegate?.userTokenWasSaved(result: true)
                }
             //   self.dismiss(animated: true)
                
            }
        }
    }
    
}
 //MARK: - Protocol userTokenIsSaved -
protocol UserTokenHasBeenSavedDelegate{
    func userTokenWasSaved(result: Bool)
}
