//
//  DetailView.swift
//  PracticaIOSAvanzado
//
//  Created by Alberto Junquera Ramírez on 13/2/23.
//

import UIKit
import Kingfisher
class DetailView: UIView{
    
    //MARK: - SubViws -
    
    let detailImage: UIImageView = {
        let image = UIImageView()
        
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    let detailName: UILabel = {
        let label = UILabel()
        
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = UIColor(named: ResourceName.gokuBlue.rawValue)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let detailDescription : UILabel = {
        let label = UILabel()
        
        label.textColor = UIColor(named: ResourceName.gokuBlue.rawValue)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
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
        backgroundColor = UIColor(named: ResourceName.gokuOrange.rawValue)
        
        addSubview(detailImage)
        addSubview(detailName)
        addSubview(detailDescription)
        
        NSLayoutConstraint.activate([
            
            detailImage.topAnchor.constraint(equalTo: topAnchor, constant: 75),
            detailImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            detailImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            detailImage.heightAnchor.constraint(equalToConstant: 230),
            
            
            detailName.topAnchor.constraint(equalTo: detailImage.bottomAnchor, constant: 15),
            detailName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            detailName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            detailName.heightAnchor.constraint(equalToConstant: 20),
            
            
            detailDescription.topAnchor.constraint(equalTo: detailName.bottomAnchor, constant: 10),
            detailDescription.leadingAnchor.constraint(equalTo: detailImage.leadingAnchor),
            detailDescription.trailingAnchor.constraint(equalTo: detailImage.trailingAnchor),
            detailDescription.heightAnchor.constraint(equalToConstant: 350),
            
        ])
    }
    
    //MARK: - update UI method -
    
    func configureDetailView(_ model: Heroe){
        self.detailImage.kf.setImage(with: URL(string: model.photo))
        self.detailName.text = model.name
        self.detailDescription.text = model.description
    }
}

