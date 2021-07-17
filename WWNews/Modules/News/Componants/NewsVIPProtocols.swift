//
//  NewsVIPProtocols.swift
//  WWNews
//
//  Created by Mohamed Shemy on Sat 17 Jul 2021.
//  Copyright © 2021 Mohamed Shemy. All rights reserved.
//

import Foundation

// MARK: VIP Protocols

// MARK: View

protocol NewsViewDelegate: AnyObject
{
    var interactor: NewsInteractorDelegate? { get set }
    var router: NewsRouter? { get set }
    
    func display(articles dataSource: ArticleDataSource)
    func handelEmptyResponse()
    func display(error message: Alert)
}

// MARK: Interactor

protocol NewsInteractorDelegate: AnyObject
{
    var presenter: NewsPresenterDelegate? { get set }
    
    init(_ networkManager: NewsNetworkable)
    func getTopHeadlines(in country: String)
    func search(for key: String)
    func loadMoreArticles()
}

// MARK: Presenter

protocol NewsPresenterDelegate: AnyObject
{
    var view: NewsViewDelegate? { get set }
    
    func didRecive(articles: [Article])
    func didReciveEmptyResponse()
    func didRecive(error message: Alert)
}
