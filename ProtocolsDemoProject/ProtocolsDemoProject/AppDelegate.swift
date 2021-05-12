//
//  AppDelegate.swift
//  ProtocolsDemoProject
//
//  Created by Emre Ergün on 11.05.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()
        window?.rootViewController = controller
        window?.makeKeyAndVisible()
        
        return true
    }
}

