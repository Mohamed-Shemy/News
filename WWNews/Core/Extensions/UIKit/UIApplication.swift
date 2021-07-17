//
//  UIApplication.swift
//  WWNews
//
//  Created by Mohamed Shemy on Fri 16 Jul 2021.
//  Copyright © 2021 Mohamed Shemy. All rights reserved.
//

import UIKit

extension UIApplication
{
    static var keyWindow: UIWindow
    {
        UIApplication.shared.windows.filter { $0.isKeyWindow }.first ??
            UIWindow(frame: UIScreen.main.bounds)
    }
}
