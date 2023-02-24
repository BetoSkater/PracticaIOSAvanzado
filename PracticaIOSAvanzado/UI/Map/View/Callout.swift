//
//  Callout.swift
//  PracticaIOSAvanzado
//
//  Created by Alberto Junquera Ramírez on 23/2/23.
//

import UIKit
import Kingfisher

class Callout: UIView {
    
    private let heroeNameLabel = UILabel(frame: .zero)
    private let dateLabel = UILabel(frame: .zero)
    private let heroeImage = UIImageView(frame: .zero)
    
    private let mapViewAnnotation: MapViewAnnotation
    
    var goingTotheHeroeDetailsView : ((Heroe) -> Void)?
    
     //MARK: - Inits -
    
    init(mapViewAnnotation: MapViewAnnotation){
        self.mapViewAnnotation = mapViewAnnotation
        super.init(frame: .zero)
        
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
     //MARK: - SetUp Methods -
 
    func setUpView(){
        translatesAutoresizingMaskIntoConstraints = false
        
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(goToDetailView)))
        
        setUpHeroeNameLabel()
        setUpDateLabel()
        setUpHeroeImage()
    }
    
    private func setUpHeroeNameLabel(){
        heroeNameLabel.text = mapViewAnnotation.heroeName
        
        addSubview(heroeNameLabel)
        heroeNameLabel.translatesAutoresizingMaskIntoConstraints = false
        heroeNameLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        heroeNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 5).isActive = true
        heroeNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: 5).isActive = true
        
       
        
    }
    
    
    private func setUpDateLabel(){
        //dateLabel.text = mapViewAnnotation.heroeDate.formatted(date: .complete, time: .complete)
        dateLabel.text = mapViewAnnotation.heroeDate
        
        addSubview(dateLabel)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.topAnchor.constraint(equalTo: heroeNameLabel.bottomAnchor,constant: 5).isActive = true
        dateLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 5).isActive = true
        dateLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: 5).isActive = true
        
    }
    
    
    private func setUpHeroeImage(){
        heroeImage.kf.setImage(with: URL(string: mapViewAnnotation.heroeImage))
        heroeImage.clipsToBounds = true
        heroeImage.contentMode = .scaleAspectFill
        
        
        addSubview(heroeImage)
        heroeImage.translatesAutoresizingMaskIntoConstraints = false
        heroeImage.topAnchor.constraint(equalTo: dateLabel.bottomAnchor,constant: 5).isActive = true
        heroeImage.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 5).isActive = true
        heroeImage.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -5).isActive = true
        heroeImage.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        heroeImage.heightAnchor.constraint(equalToConstant: 200).isActive = true
        heroeImage.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        
        heroeImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(goToDetailView)))
        
    }
    @objc func goToDetailView(){
        //TODO: Set navigation in here
        
        debugPrint("goingToDetailView activated.")
      /*
        let heroeModel = Heroe(id: "", name: "auxDate! ?? ", description: "desc", favorite: true, photo: "https://cdn.alfabetajuega.com/alfabetajuega/2020/12/freezer-dragon-ball-bebe-abj.jpg?width=300")
        
        //let heroeDetailVC = DetailViewController(heroeModel: heroeModel)
        
        self.mapViewAnnotation.heroeDate
        
   //     goingTotheHeroeDetailsView()
        
       // present(heroeDetailVC, animated: true)
        */
    }
}
