//
//  NewsPresenter.swift
//  WWNews
//
//  Created by Mohamed Shemy on Sat 17 Jul 2021.
//  Copyright © 2021 Mohamed Shemy. All rights reserved.
//

import Foundation

class NewsPresenter: NewsPresenterDelegate
{
    // MARK:- Properties
    
    weak var view: NewsViewDelegate?
    private var articlesDataSource: ArticleDataSource!
    
    // MARK:- Methods
    
    func didRecive(articles: [Article])
    {
        let viewModels = articles.compactMap(\.viewModel)
        articlesDataSource = .init(viewModels)
        view?.display(articles: articlesDataSource)
    }
    
    func didReciveEmptyResponse()
    {
        view?.handelEmptyResponse()
    }
    
    func didRecive(error message: Alert)
    {
        view?.display(error: message)
    }
}
