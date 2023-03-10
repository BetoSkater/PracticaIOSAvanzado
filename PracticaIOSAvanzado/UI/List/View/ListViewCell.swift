//
//  ListViewCell.swift
//  PracticaIOSAvanzado
//
//  Created by Alberto Junquera Ramírez on 22/2/23.
//

import UIKit
import Kingfisher

class ListViewCell: UITableViewCell{
    
    let cellImageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
        
    }()
    
    let cellTitle: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = UIColor(named: ResourceName.gokuOrange.rawValue)
        return label
        
    }()
    
    let cellDesc: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 3
        label.textColor = UIColor(named: ResourceName.gokuOrange.rawValue)
        
        return label
        
    }()
    
    //MARK: - Inits -
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - setUpViews -
    
    func setUpView(){
        backgroundColor = UIColor(named: ResourceName.gokuBlue.rawValue)
        
        addSubview(cellImageView)
        addSubview(cellTitle)
        addSubview(cellDesc)
        
        NSLayoutConstraint.activate([
            
            cellImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            cellImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            cellImageView.heightAnchor.constraint(equalToConstant: 100),
            cellImageView.widthAnchor.constraint(equalToConstant: 120),
            
            cellTitle.topAnchor.constraint(equalTo: topAnchor,constant: 10),
            cellTitle.leadingAnchor.constraint(equalTo: cellImageView.trailingAnchor, constant: 10),
            cellTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant:  -10),
            cellTitle.heightAnchor.constraint(equalToConstant: 20),
            
            
            cellDesc.topAnchor.constraint(equalTo: cellTitle.bottomAnchor, constant: 1),
            cellDesc.leadingAnchor.constraint(equalTo: cellTitle.leadingAnchor),
            cellDesc.trailingAnchor.constraint(equalTo: cellTitle.trailingAnchor),
            cellDesc.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
            
            
        ])
    }
    
    
    //MARK: - Method to load each cell -
    
    func configureCell(_ model: Heroe){
        self.cellImageView.kf.setImage(with: URL(string: model.photo))
        self.cellTitle.text = model.name
        self.cellDesc.text = model.description
    }
    
    
    
    
}


