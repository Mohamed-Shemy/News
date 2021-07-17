//
//  NewsInteractor.swift
//  WWNews
//
//  Created by Mohamed Shemy on Sat 17 Jul 2021.
//  Copyright © 2021 Mohamed Shemy. All rights reserved.
//

import Foundation

class NewsInteractor: NewsInteractorDelegate
{
    typealias NewsRequest =  (String, Int, @escaping (Result<ArticlesResponse, Error>) -> Void) -> ()
    // MARK:- Properties
    
    var presenter: NewsPresenterDelegate?
    
    private var networkManager: NewsNetworkable
    private var currentPage = 1
    private var lastRequest: NewsRequest!
    private var lastRequestKey = ""
    private var country = ""
    private var articles: [Article] = []
    
    // MARK:- init
    
    required init(_ networkManager: NewsNetworkable = NewsNetworkManager())
    {
        self.networkManager = networkManager
    }
    
    // MARK:- Methods
    
    func getTopHeadlines(in country: String)
    {
        self.country = country
        setLastRequestInfo(networkManager.getTopHeadlines, country)
        resetFields()
        invokeLastRequestWithCurrentInfo()
    }
    
    func search(for key: String)
    {
        if key.isNotEmptyOrSpaces
        {
            searchForNew(key: key)
        }
        else
        {
            getTopHeadlines(in: country)
        }
    }
    
    func loadMoreArticles()
    {
        currentPage += 1
        invokeLastRequestWithCurrentInfo()
    }
    
    // MARK:- Helpers
    
    private func setLastRequestInfo(_ lastRequest: @escaping NewsRequest, _ key: String)
    {
        self.lastRequest = lastRequest
        lastRequestKey = key
    }
    
    private func resetFields()
    {
        currentPage = 1
        articles = []
    }
    
    private func invokeLastRequest(_ key: String, page: Int)
    {
        lastRequest(key, page, articlesCallBack)
    }
    
    private func invokeLastRequestWithCurrentInfo()
    {
        invokeLastRequest(lastRequestKey, page: currentPage)
    }
    
    private func searchForNew(key: String)
    {
        setLastRequestInfo(networkManager.search, key)
        resetFields()
        invokeLastRequestWithCurrentInfo()
    }
    
    private func articlesCallBack(_ result: Result<ArticlesResponse, Error>)
    {
        switch result
        {
            case let .success(response): presentArticlesResponse(response)
            case .failure: presenter?.didRecive(error: .unkown(""))
        }
    }
    
    private func presentArticlesResponse(_ response: ArticlesResponse)
    {
        guard let status = response.status, status != .error else {
            presenter?.didRecive(error: .unkown(response.message ?? "Unkown error!"))
            return
        }
        
        guard let articles = response.articles, articles.isNotEmpty else {
            presenter?.didReciveEmptyResponse()
            return
        }
        
        self.articles.append(contentsOf: articles)
        presenter?.didRecive(articles: self.articles)
    }
}
