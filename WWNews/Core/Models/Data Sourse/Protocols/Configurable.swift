//
//  Configurable.swift
//  WWNews
//
//  Created by Mohamed Shemy on Fri 16 Jul 2021.
//  Copyright © 2021 Mohamed Shemy. All rights reserved.
//

import Foundation

protocol Configurable: AnyObject
{
    associatedtype Model
    func configure(_ item: Model, at indexPath: IndexPath)
}
