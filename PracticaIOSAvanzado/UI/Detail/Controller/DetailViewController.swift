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
    
    private var heroeModel: Heroe?
    
    //MARK: - Inits -
    
    init(heroeModel: Heroe){
        super.init(nibName: nil, bundle: nil)
        self.heroeModel = heroeModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - viewDidLoad() and loadView() -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Assigments
        detailViewModel = DetailViewModel()
        
        //SetUp methods
        updateUI()
    }
    
    override func loadView() {
        view = DetailView()
    }
    
    //MARK: - update UI -
    
    private func updateUI(){
        if let heroeModel{
            mainView.configureDetailView(heroeModel)
        }
    }
}
