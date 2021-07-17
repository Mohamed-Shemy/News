//
//  String.swift
//  WWNews
//
//  Created by Mohamed Shemy on Sat 17 Jul 2021.
//  Copyright © 2021 Mohamed Shemy. All rights reserved.
//

import Foundation

extension String
{
    var trimmed: String
    {
        return trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    var isNotEmpty: Bool
    {
        return !isEmpty
    }
    
    var isNotEmptyOrSpaces: Bool
    {
        return !isEmptyOrSpaces
    }
    
    var isEmptyOrSpaces: Bool
    {
        return isEmpty || trimmed.isEmpty
    }
    
    func replace(formate: String, with newFormate: String) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = formate
        guard let date = dateFormatter.date(from: self) else { return self }
        
        dateFormatter.dateFormat = newFormate
        return dateFormatter.string(from: date)
    }
}
