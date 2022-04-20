//
//  AppDelegate.swift
//  NewsApp
//
//  Created by Utku on 19.04.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let splashVC = SplashVC(nibName: "SplashVC", bundle: nil)
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = splashVC
        window?.makeKeyAndVisible()
        return true
    }
    
}

