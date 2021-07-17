//
//  Dictionary.swift
//  WWNews
//
//  Created by Mohamed Shemy on Sat 17 Jul 2021.
//  Copyright © 2021 Mohamed Shemy. All rights reserved.
//

import Foundation

extension Dictionary
{
    static func + (lhs: [Key: Value], rhs: [Key: Value]) -> [Key: Value]
    {
        var result = lhs
        rhs.forEach{ result[$0] = $1 }
        return result
    }
    
    static func += (lhs: inout [Key: Value], rhs: [Key: Value])
    {
        lhs = lhs + rhs
    }
}
