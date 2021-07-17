//
//  UIViewController + NVActivityIndicator.swift
//  WWNews
//
//  Created by Mohamed Shemy on Fri 16 Jul 2021.
//  Copyright © 2021 Mohamed Shemy. All rights reserved.
//

import NVActivityIndicatorView

extension UIViewController: NVActivityIndicatorViewable
{
    func showLoader(type: NVActivityIndicatorType? = .ballPulseSync)
    {
        let size = CGSize(width: 50, height: 50)
        startAnimating(size, message: "Loading ...", type: type)
    }
    
    public func hideLoader()
    {
        stopAnimating()
    }
}
