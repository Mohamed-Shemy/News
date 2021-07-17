//
//  AppRouter.swift
//  WWNews
//
//  Created by Mohamed Shemy on Fri 16 Jul 2021.
//  Copyright © 2021 Mohamed Shemy. All rights reserved.
//

import UIKit

class AppRouter
{
    // MARK:- Properties
    
    private var window: UIWindow
    private var navigationController: UINavigationController
    
    // MARK:- init
    
    init(_ window: UIWindow? = nil)
    {
        self.window = window ?? UIWindow(frame: UIScreen.main.bounds)
        let navigationController = UINavigationController()
        self.navigationController = navigationController
        setNavigationControllerStyle()
        setRoot(navigationController)
    }
    
    // MARK:- Methods
    
    private func setNavigationControllerStyle()
    {
        navigationController.navigationBar.prefersLargeTitles = true
    }
    
    func launchFirstScreen()
    {
        // 
    }
    
    // MARK:- Helpers
    
    private func setRoot(_ viewController: UIViewController)
    {
        window.rootViewController = viewController
        window.makeKeyAndVisible()
    }
}
