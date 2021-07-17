//
//  NewsAPI.swift
//  WWNews
//
//  Created by Mohamed Shemy on Sat 17 Jul 2021.
//  Copyright © 2021 Mohamed Shemy. All rights reserved.
//

import Moya

enum NewsAPI
{
    case topHeadlines(_ country: String, _ page: Int)
    case search(String, _ page: Int)
}

extension NewsAPI: TargetType, BaseAPIParametersProtocol
{
    var path: String
    {
        switch self
        {
            case .topHeadlines: return "top-headlines"
            case .search: return "everything"
        }
    }
    
    var method: Method
    {
        .get
    }
    
    var sampleData: Data
    {
        Data()
    }
    
    var task: Task
    {
        var parameters = authParameters + ["sortBy": "publishedAt"]
        
        switch self
        {
            case let .topHeadlines(country, page): parameters += ["country": country, "page": page]
            case let .search(key, page): parameters += ["q": key, "page": page]
        }
        
        return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
    }
}
