//
//  AppDelegate.swift
//  ScrollNodeTest
//
//  Created by Nikita Arutyunov on 2/22/20.
//  Copyright © 2020 nickaroot. All rights reserved.
//

import UIKit
import AsyncDisplayKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_: UIApplication,
                     didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let tabBarController = ASTabBarController()
        
        tabBarController.tabBar.isTranslucent = false
        
        let testViewController = ASViewController(node: TestNode())
        
        let navigationController = ASNavigationController(rootViewController: testViewController)
        
        navigationController.navigationBar.isTranslucent = false
        
        tabBarController.setViewControllers([navigationController], animated: false)
        
        window = UIWindow()
        window?.backgroundColor = .white
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()

//        ASControlNode.enableHitTestDebug = true
//        ASDisableLogging()

        return true
    }
}

