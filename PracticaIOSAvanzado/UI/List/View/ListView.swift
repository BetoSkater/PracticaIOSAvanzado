//
//  ListView.swift
//  PracticaIOSAvanzado
//
//  Created by Alberto Junquera Ramírez on 13/2/23.
//

import UIKit

class ListView: UIView{
    
    let tableSearchBar = {
       
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
       
        return searchBar
    }()
    
    
    let tableView = {
        
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(ListViewCell.self, forCellReuseIdentifier: ResourceName.tableCell.rawValue)
        
        return table
    }()
     //MARK: - Inits -
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
     //MARK: - Set Up View -
    
    func setUpView(){
        
        backgroundColor = .white
        
        addSubview(tableSearchBar)
        addSubview(tableView)
  
        
        NSLayoutConstraint.activate([
        
            tableSearchBar.topAnchor.constraint(equalTo: topAnchor, constant: 100),
            tableSearchBar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            tableSearchBar.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            tableSearchBar.heightAnchor.constraint(equalToConstant: 40),
            
        
            tableView.topAnchor.constraint(equalTo: tableSearchBar.bottomAnchor,constant: 10),
            tableView.leadingAnchor.constraint(equalTo: tableSearchBar.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: tableSearchBar.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -100),
            
            
        
        
        ])
        
    }
    
}
