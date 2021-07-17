//
//  Source.swift
//  WWNews
//
//  Created by Mohamed Shemy on Sat 17 Jul 2021.
//  Copyright © 2021 Mohamed Shemy. All rights reserved.
//

import Foundation

struct Source: Codable
{
    let id, name: String?
    
    var viewModel: SourceViewModel?
    {
        guard let name = name else { return nil }
        return .init(id: id ?? name, name: name)
    }
}

struct SourceViewModel
{
    let id, name: String
}
