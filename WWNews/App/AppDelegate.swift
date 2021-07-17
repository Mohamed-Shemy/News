//
//  AppDelegate.swift
//  WWNews
//
//  Created by Mohamed Shemy on Fri 16 Jul 2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate
{
    private lazy var appRouter = AppRouter()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
    {
        appRouter.launchFirstScreen()
        return true
    }
}

