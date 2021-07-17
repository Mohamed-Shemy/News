//
//  BaseAPIParametersProtocol.swift
//  WWNews
//
//  Created by Mohamed Shemy on Fri 16 Jul 2021.
//  Copyright © 2021 Mohamed Shemy. All rights reserved.
//

import Moya

enum InfoKey: String
{
    case api = "API_KEY"
    case baseURL = "BASE_URL"
}

protocol BaseAPIParametersProtocol{}

extension BaseAPIParametersProtocol
{
    var baseDomain: String { getValue(for: .baseURL) ?? "" }
    var baseURL: URL { URL(string: baseDomain)! }
    var key: String { getValue(for: .api) ?? "" }
    
    var authParameters: [String: Any]
    {
        ["apiKey": key]
    }
    
    var headers: [String: String]?
    {
        [
            "Content-type": "application/json"
        ]
    }
    
    private func getValue<Value>(for key: InfoKey) -> Value?
    {
        Bundle.main.infoDictionary?[key.rawValue] as? Value
    }
}
