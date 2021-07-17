//
//  UIView.swift
//  WWNews
//
//  Created by Mohamed Shemy on Fri 16 Jul 2021.
//  Copyright © 2021 Mohamed Shemy. All rights reserved.
//

import UIKit

extension UIView
{
    static var identifier: String { "\(Self.self)" }
    
    static var nib: UINib { UINib(nibName: identifier, bundle: nil) }
}
