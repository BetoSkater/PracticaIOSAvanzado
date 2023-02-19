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
    
    //TODO: No init? I didn't need it here the last time, proably in the herolist
    
     //MARK: - vireDidLoad and loadView overrrides -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginViewModel = LoginViewModel()
     
        //TODO: add here the button functionality
        
        
    }
    

    override func loadView() {
        view = LoginView()
    }
    
     //MARK: - Button methods -
   
   @objc func loginButtonTapped(sender: UIButton!){
       
   }
   
   func performLogIn(){
       //Retrieving login info:
       
       if !mainView.emailTextField.text!.isEmpty && !mainView.passTextField.text!.isEmpty{
           
           let email = mainView.emailTextField.text!
           let password = mainView.passTextField.text!
           
       //    loginViewModel?.logIn(with: email, and: password)
       }
   }
}
