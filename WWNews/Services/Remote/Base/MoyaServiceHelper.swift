//
//  MoyaServiceHelper.swift
//  WWNews
//
//  Created by Mohamed Shemy on Wed 14 Jul 2021.
//  Copyright © 2021 Mohamed Shemy. All rights reserved.
//

import Moya
import NVActivityIndicatorView

class MoyaServiceHelper<T: TargetType>
{
    // MARK:- Properties
    
    private var provider: MoyaProvider<T>
    
    // MARK:- Init
    
    init(type: ServiceType)
    {
        var plugins: [PluginType] = []
         
        let networkActivityClosure: NetworkActivityPlugin.NetworkActivityClosure = Self.networkActivityAction
        let networkActivityPlugin = NetworkActivityPlugin(networkActivityClosure: networkActivityClosure)
        
        plugins.append(networkActivityPlugin)
        
        let serviceType = type == .live ? MoyaProvider<T>.neverStub : MoyaProvider<T>.immediatelyStub
        
        self.provider = MoyaProvider<T>(stubClosure: serviceType, plugins: plugins)
    }
    
    // MARK:- Methods
    
    func request<C: Codable>(targetCase: T, completion: @escaping (Result<C, Error>) -> Void)
    {
        provider.request(targetCase)
        { [weak self] result in
            
            switch result
            {
                case let .success(value):
                    self?.decode(response: value, completion: completion)
                    
                case let .failure(error):
                    completion(.failure(error))
            }
        }
    }
    
    private func decode<C: Codable>(response value: Response, completion: @escaping (Result<C, Error>) -> Void)
    {
        do
        {
            let decoder = JSONDecoder()
            // let json = String(data: value.data, encoding: .utf8)
            // print(json)
            let response = try decoder.decode(C.self, from: value.data)
            completion(.success(response))
        }
        catch(let error)
        {
            completion(.failure(error))
        }
    }
    
    //MARK:-
    
    private static func networkActivityAction(_ activity: NetworkActivityChangeType, _ target: TargetType)
    {
        switch activity
        {
            case .began: ActivityIndicator.startLoading()
            case .ended: ActivityIndicator.stopLoading()
        }
    }
}
