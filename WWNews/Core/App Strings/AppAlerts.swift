//
//  AppAlerts.swift
//  WWNews
//
//  Created by Mohamed Shemy on Fri 16 Jul 2021.
//  Copyright © 2021 Mohamed Shemy. All rights reserved.
//

import Foundation

enum Alert
{
    // MARK:- Cases
    
    case unkown(String)
    
    case unableToLoadArticles
    
    // MARK:- Values
    
    var value: String
    {
        switch self
        {
            case let .unkown(message): return message
            case .unableToLoadArticles: return "Unable to load articles!"
        }
    }
}
