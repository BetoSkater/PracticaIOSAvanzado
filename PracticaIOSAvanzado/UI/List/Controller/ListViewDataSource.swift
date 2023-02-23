//
//  ListViewDataSource.swift
//  PracticaIOSAvanzado
//
//  Created by Alberto Junquera Ramírez on 22/2/23.
//

import UIKit

final class ListViewDataSource: NSObject, UITableViewDataSource{
    
    private let tableView: UITableView
    
    //At first, there are no heroes, onces coreData gives data, the assigment refreses the tableview
    private(set) var list: [Heroe] = [] {
        didSet{
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
     //MARK: - Init  -
    
    init(tableView: UITableView, list: [Heroe] = []) {
        self.tableView = tableView
        self.list = list
    }
    
    //MARK: - ListUpdater-
    
    func set(list: [Heroe]){
        self.list = list
    }
    
    
     //MARK: - Protocol methods -
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ResourceName.tableCell.rawValue, for: indexPath) as! ListViewCell
        
        let heroe = list[indexPath.row]
        cell.configureCell(heroe)
        
        return cell
    }
    
    
}
