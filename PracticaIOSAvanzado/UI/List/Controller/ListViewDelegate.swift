//
//  ListViewDelegate.swift
//  PracticaIOSAvanzado
//
//  Created by Alberto Junquera Ramírez on 22/2/23.
//

import UIKit

class ListViewDelegate: NSObject, UITableViewDelegate{
    
    var didTapOnCell: ((Int) -> Void)?
    
    //MARK: - Delegate Methods -
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didTapOnCell?(indexPath.row)
    }
    
}
