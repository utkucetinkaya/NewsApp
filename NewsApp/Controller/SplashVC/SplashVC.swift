//
//  SplashVC.swift
//  NewsApp
//
//  Created by Utku on 19.04.2022.
//

import UIKit

class SplashVC: UIViewController {

    var window: UIWindow?
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            let vc = NewsVC(nibName: "NewsVC", bundle: nil)
            let navController = UINavigationController(rootViewController: vc)
            self.window = UIWindow(frame: UIScreen.main.bounds)
            self.window?.rootViewController = navController
            self.window?.makeKeyAndVisible()
        }
    }
}
