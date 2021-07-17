//
//  UIViewController + Navigator.swift
//  WWNews
//
//  Created by Mohamed Shemy on Fri 16 Jul 2021.
//  Copyright © 2021 Mohamed Shemy. All rights reserved.
//

import UIKit

extension UIViewController
{
    var isModal: Bool
    {
        let presentingIsModal = presentingViewController != nil
        let presentingIsNavigation =
            navigationController?.presentingViewController?.presentedViewController == navigationController
        let presentingIsTabBar = tabBarController?.presentingViewController is UITabBarController
        return presentingIsModal || presentingIsNavigation || presentingIsTabBar
    }
    
    func pop(with animation: Bool = true)
    {
        navigationController?.popViewController(animated: animation)
    }
    
    func push(viewController: UIViewController, animated: Bool = true)
    {
        navigationController?.pushViewController(viewController, animated: animated)
    }
    
    func present(viewController: UIViewController, animated: Bool = true)
    {
        present(viewController, animated: animated, completion: nil)
    }
    
    func dismiss(animated: Bool = true)
    {
        if isModal
        {
            dismiss(animated: animated, completion: nil)
        }
        else
        {
            pop()
        }
    }
}

extension UIViewController
{
    @IBAction func dismissAction(_ sender: Any)
    {
        dismiss()
    }
}

extension UIViewController
{
    func present(navigatable: Navigatable, animated: Bool = true)
    {
        present(navigatable.viewController, animated: true, completion: nil)
    }
    
    func push(navigatable: Navigatable, animated: Bool = true)
    {
        navigationController?.pushViewController(navigatable.viewController, animated: animated)
    }
}
