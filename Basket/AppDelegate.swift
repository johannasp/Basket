//
//  AppDelegate.swift
//  Basket
//
//  Created by Johanna Smith-Palliser on 1/19/17.
//  Copyright © 2017 Johanna Smith-Palliser. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        FIRApp.configure()
        
        window = UIWindow()
        window?.rootViewController = UINavigationController(rootViewController: CartViewController())
        window?.makeKeyAndVisible()
        
        return true
    }
}

