//
//  LoginView.swift
//  PracticaIOSAvanzado
//
//  Created by Alberto Junquera Ramírez on 10/2/23.
//

import UIKit

enum ResourcesNames: String{
    case loginBackground = "fondo2"
}

class LoginView: UIView{
    
    //MARK: - SubViews -
    
    let backgroundView: UIImageView = {
       let baseView = UIImageView()
        
        baseView.image = UIImage(named: ResourcesNames.loginBackground.rawValue)
        baseView.contentMode = .scaleAspectFill
        baseView.translatesAutoresizingMaskIntoConstraints = false
        
        return baseView
        
    }()
    
    let emailTextField:  UITextField = {
        let textField = UITextField()
        
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        textField.layer.cornerRadius = 10
        textField.placeholder = "E-mail"
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    
    let passTextField:  UITextField = {
        let textField = UITextField()
        
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        textField.layer.cornerRadius = 10
        textField.placeholder = "Password"
        textField.isSecureTextEntry = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    let loginButton: UIButton = {
        let button = UIButton()
        
        button.backgroundColor = .white
        button.setTitle("Log in", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    
    //MARK: - Inits -
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods -
    
    func setUpViews(){
        addSubview(backgroundView)
        addSubview(emailTextField)
        addSubview(passTextField)
        addSubview(loginButton)
        
        NSLayoutConstraint.activate([
        
            backgroundView.topAnchor.constraint(equalTo: topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            
            emailTextField.topAnchor.constraint(equalTo: topAnchor, constant: 300),
            emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
            emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50),
            emailTextField.heightAnchor.constraint(equalToConstant: 50),
            
            
            passTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 25),
            passTextField.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            passTextField.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            passTextField.heightAnchor.constraint(equalToConstant: 50),
            
            
            loginButton.topAnchor.constraint(equalTo: passTextField.bottomAnchor, constant: 50),
            loginButton.leadingAnchor.constraint(equalTo: passTextField.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: passTextField.trailingAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            
        ])
    }
}
