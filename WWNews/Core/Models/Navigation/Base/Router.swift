//
//  Router.swift
//  WWNews
//
//  Created by Mohamed Shemy on Fri 16 Jul 2021.
//  Copyright © 2021 Mohamed Shemy. All rights reserved.
//

import UIKit

class Router<Destination: Navigatable, Controller: UIViewController>: Navigator
{
    // MARK: Properties
    
    weak var viewController: Controller?
    
    // MARK: init
    
    init(_ view: Controller?)
    {
        viewController = view
    }
}
