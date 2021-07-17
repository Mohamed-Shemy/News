//
//  ArticleTableViewCell.swift
//  WWNews
//
//  Created by Mohamed Shemy on Sat 17 Jul 2021.
//  Copyright © 2021 Mohamed Shemy. All rights reserved.
//

import UIKit

class ArticleTableViewCell: ConfigurableTableViewCell
{
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var sourceNameLabel: UILabel!
    
    func configure(_ article: ArticleViewModel, at indexPath: IndexPath)
    {
        thumbnailImageView.setImage(from: article.urlToImage, placeholder: #imageLiteral(resourceName: "news.default"))
        descriptionLabel.text = article.description
        sourceNameLabel.text = article.source.name
    }
}
