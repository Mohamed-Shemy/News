//
//  Article.swift
//  WWNews
//
//  Created by Mohamed Shemy on Sat 17 Jul 2021.
//  Copyright © 2021 Mohamed Shemy. All rights reserved.
//

import Foundation

struct Article: Codable
{
    let author, title, description,
        url, urlToImage, publishedAt,
        content: String?
    let source: Source?
    
    var viewModel: ArticleViewModel?
    {
        guard
            let auther = author,
            let title = title,
            let description = description,
            let source = source?.viewModel
        else { return nil }
        
        let publishedAt = publishedAt?
            .replacingOccurrences(of: "T", with: " ")
            .replacingOccurrences(of: "Z", with: "")
            .replace(formate: "yyyy-MM-dd HH:mm:ss", with: "d MMM yyyy, HH:mm")
        
        return .init(author: auther, title: title,
                     description: description, url: url ?? "",
                     urlToImage: urlToImage ?? "", publishedAt: publishedAt ?? "",
                     content: content ?? "", source: source)
    }
}

struct ArticleViewModel
{
    let author, title, description,
        url, urlToImage, publishedAt,
        content: String
    let source: SourceViewModel
}
