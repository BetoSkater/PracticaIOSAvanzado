//
//  DetailViewController.swift
//  PracticaIOSAvanzado
//
//  Created by Alberto Junquera Ramírez on 13/2/23.
//

import UIKit

class DetailViewController: BaseViewController{
    //MARK: - View Assignment -
    
    var mainView: DetailView{self.view as! DetailView}
    var detailViewModel: DetailViewModel?
    
    //TODO: No init? I didn't need it here the last time, proably in the herolist
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailViewModel = DetailViewModel()
        //mainView.backgroundColor = .white
        //TODO: add here the button functionality
    }
    
    
    override func loadView() {
        view = DetailView()
    }
}
