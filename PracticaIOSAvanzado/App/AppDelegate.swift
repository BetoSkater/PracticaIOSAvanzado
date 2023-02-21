//
//  AppDelegate.swift
//  PracticaIOSAvanzado
//
//  Created by Alberto Junquera Ramírez on 10/2/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

     //MARK: - CoreData -

    lazy var coreDataManager: CoreDataManager = .init(modelName: "Heroes")
    
    static let sharedAppDelegate: AppDelegate = {
        
        guard let delegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError("CoreData AppDelegate Error: error during the AppDelegate creation.")
        }
        return delegate
    }()
    
    
     //MARK: - Core App Delegate Methods -
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

