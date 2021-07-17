//
//  ArticleViewController.swift
//  WWNews
//
//  Created by Mohamed Shemy on Sat 17 Jul 2021.
//  Copyright © 2021 Mohamed Shemy. All rights reserved.
//

import UIKit

class ArticleViewController: UIViewController
{
    private var article: ArticleViewModel
    
    init(_ article: ArticleViewModel)
    {
        self.article = article
        super.init(nibName: Self.identifier, bundle: nil)
    }
    
    required init?(coder: NSCoder)
    {
        fatalError("use init(_:)")
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
}
