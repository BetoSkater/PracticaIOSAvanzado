//
//  AppTabBar.swift
//  PracticaIOSAvanzado
//
//  Created by Alberto Junquera Ramírez on 14/2/23.
//

import UIKit

class AppTabBar: UITabBarController{
    
    //MARK: - ViewDidLoad: Loading the TabBar Controllers -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpLayout()
        setUpTabs()
        setUpLayoutBorder()
        
    }
    
    //MARK: - Set Up Tabs -
    
    private func setUpTabs(){
        
        let mainViewController = UINavigationController(rootViewController: ListViewController())
        let mainViewTabBarImage = UIImage(systemName: ResourceName.listIcon.rawValue)
        let mainViewTabBarText = TextString.firstTabBar.rawValue
        mainViewController.tabBarItem = UITabBarItem(title: mainViewTabBarText, image: mainViewTabBarImage, tag: 0)
        
        
        let secondViewController = UINavigationController(rootViewController: MapViewController())
        let secondTabBarImage = UIImage(systemName: ResourceName.mapIcon.rawValue)
        let secondTabBarText  = TextString.secondTabBar.rawValue
        
        secondViewController.tabBarItem = UITabBarItem(title: secondTabBarText, image: secondTabBarImage, tag: 1)
        
        viewControllers = [mainViewController, secondViewController]
        
    }
    
    //MARK: - Set Up Layout -
    
    private func setUpLayout(){
        
        tabBar.tintColor = UIColor(named: ResourceName.gokuBlue.rawValue)
        tabBar.backgroundColor = UIColor(named: ResourceName.gokuOrange.rawValue)
        
    }
    
    private func setUpLayoutBorder(){
        //TODO: Fix. I need the line to be blue, but it tint the whole background.
        tabBar.layer.borderWidth = 0.50
        tabBar.layer.backgroundColor = UIColor.clear.cgColor
        tabBar.clipsToBounds = true
    }
    
    //MARK: - Static methods to change the apperance from any view or viewController -
    
    //TODO: Pending.
    
}
