//
//  NewsNetworkable.swift
//  WWNews
//
//  Created by Mohamed Shemy on Sat 17 Jul 2021.
//  Copyright © 2021 Mohamed Shemy. All rights reserved.
//

import Foundation

protocol NewsNetworkable: AnyObject
{
    func getTopHeadlines(in country: String, page: Int, completion: @escaping (Result<ArticlesResponse, Error>) -> Void)
    func search(for key: String, page: Int, completion: @escaping (Result<ArticlesResponse, Error>) -> Void)
}
