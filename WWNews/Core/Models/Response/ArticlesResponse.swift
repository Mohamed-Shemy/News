//
//  ArticlesResponse.swift
//  WWNews
//
//  Created by Mohamed Shemy on Sat 17 Jul 2021.
//  Copyright © 2021 Mohamed Shemy. All rights reserved.
//

import Foundation

struct ArticlesResponse: Codable
{
    let status: ResponseStatus?
    let code: String?
    let message: String?
    let totalResults: Int
    let articles: [Article]?
}
