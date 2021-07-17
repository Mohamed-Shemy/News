//
//  UIViewController + Alert.swift
//  WWNews
//
//  Created by Mohamed Shemy on Fri 16 Jul 2021.
//  Copyright © 2021 Mohamed Shemy. All rights reserved.
//

import UIKit

extension UIViewController
{
    func showAlert(_ title: AppTitle, _ message: Alert)
    {
        showAlert(title.rawValue, message.value)
    }
    
    func showAlert(_ title: String, _ message: String)
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        DispatchQueue.main.async
        { [weak self] in
            self?.present(alert, animated: true,completion: nil)
        }
    }
}
