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
    
    //TODO: adding backgroundcolor in the controller? I do think that is the best way
   
        
    let detailImage: UIImageView = {
        let image = UIImageView()
       
        //TODO: Delete, just for test.
        image.kf.setImage(with: URL(string: "https://cdn.alfabetajuega.com/alfabetajuega/2020/12/goku1.jpg?width=300"))
      //  image.backgroundColor = .systemPink
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    let detailName: UILabel = {
        let label = UILabel()
        
        label.backgroundColor = .systemMint
        label.text = "Heroe"
        label.font = .boldSystemFont(ofSize: 15)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let detailDescription : UILabel = {
        let label = UILabel()
        
        label.text = "BLAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
        //label.font = .boldSystemFont(ofSize: 15)
        label.backgroundColor = .red
        label.textColor = .black
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
        backgroundColor = .orange
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
            detailName.heightAnchor.constraint(equalToConstant: 25),
            
            
            detailDescription.topAnchor.constraint(equalTo: detailName.bottomAnchor, constant: 15),
            detailDescription.leadingAnchor.constraint(equalTo: detailImage.leadingAnchor),
            detailDescription.trailingAnchor.constraint(equalTo: detailImage.trailingAnchor),
            detailDescription.heightAnchor.constraint(equalToConstant: 350),
        
        ])
    }
}

