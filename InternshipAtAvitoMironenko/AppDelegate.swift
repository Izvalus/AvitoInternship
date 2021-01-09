//
//  AppDelegate.swift
//  InternshipAtAvitoMironenko
//
//  Created by Роман Мироненко on 02.01.2021.
//  Copyright © 2021 Роман Мироненко. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        let navigation = UINavigationController(rootViewController: MainFactory().create())
        window?.rootViewController = navigation
        window?.makeKeyAndVisible()
        return true
    }

}

