//
//  ArticleViewController.swift
//  WWNews
//
//  Created by Mohamed Shemy on Sat 17 Jul 2021.
//  Copyright © 2021 Mohamed Shemy. All rights reserved.
//

import UIKit

class ArticleViewController: UIViewController
{
    // MARK:- Outlets
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var sourceNameLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    // MARK:- Properties
    
    private var article: ArticleViewModel
    
    // MARK:- init
    
    init(_ article: ArticleViewModel)
    {
        self.article = article
        super.init(nibName: Self.identifier, bundle: nil)
    }
    
    required init?(coder: NSCoder)
    {
        fatalError("use init(_:)")
    }
    
    // MARK:- Life Cycel
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        setThumbnailImageViewStyle()
        addWebsiteNavigationItem()
        display(article: article)
    }
    
    // MARK:- Methods
    
    private func setThumbnailImageViewStyle()
    {
        thumbnailImageView.layer.cornerRadius = 5
    }
    
    private func addWebsiteNavigationItem()
    {
        let websiteItem = UIBarButtonItem(barButtonSystemItem: .action,
                                          target: self, action: #selector(websiteButtonDidTapped))
        navigationItem.rightBarButtonItem = websiteItem
    }
        
    private func display(article: ArticleViewModel)
    {
        thumbnailImageView.setImage(from: article.urlToImage, placeholder: #imageLiteral(resourceName: "news.default"))
        titleLabel.text = article.title
        descriptionLabel.text = article.description
        sourceNameLabel.text = article.source.name
        authorLabel.text = article.author
        dateLabel.text = article.publishedAt
    }
    
    private func openTeamWebsite(_ link: String)
    {
        guard let url = URL(string: link) else { return }
        UIApplication.shared.open(url)
    }
    
    // MARK:- Action
    
    @objc func websiteButtonDidTapped(_ sender: Any)
    {
        openTeamWebsite(article.url)
    }
}
