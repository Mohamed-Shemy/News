//
//  NewsNetworkManager.swift
//  WWNews
//
//  Created by Mohamed Shemy on Sat 17 Jul 2021.
//  Copyright © 2021 Mohamed Shemy. All rights reserved.
//

import Foundation

class NewsNetworkManager: NewsNetworkable
{
    // MARK:- Properties
    
    private let moyaServiceHelper: MoyaServiceHelper<NewsAPI>
    
    // MARK:- Init
    
    init(type: ServiceType = .live)
    {
        moyaServiceHelper = MoyaServiceHelper(type: type)
    }
    
    // MARK:- Method
    
    func getTopHeadlines(in country: String, page: Int, completion: @escaping (Result<ArticlesResponse, Error>) -> Void)
    {
        moyaServiceHelper.request(targetCase: .topHeadlines(country, page), completion: completion)
    }
    
    func search(for key: String, page: Int, completion: @escaping (Result<ArticlesResponse, Error>) -> Void)
    {
        moyaServiceHelper.request(targetCase: .search(key, page), completion: completion)
    }
}
