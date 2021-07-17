//
//  NewsRouter.swift
//  WWNews
//
//  Created by Mohamed Shemy on Sat 17 Jul 2021.
//  Copyright © 2021 Mohamed Shemy. All rights reserved.
//

import UIKit

typealias NewsRouter = Router<NewsNavigatable, UIViewController>

enum NewsNavigatable: Navigatable
{
    case news(_ country: String)
    case article(ArticleViewModel)
    
    var viewController: UIViewController
    {
        switch self
        {
            case let .news(country): return NewsViewController(country)
            case let .article(article): return ArticleViewController(article)
        }
    }
}
