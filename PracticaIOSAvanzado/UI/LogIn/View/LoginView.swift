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
        
        NSLayoutConstraint.activate([
        
            backgroundView.topAnchor.constraint(equalTo: topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
