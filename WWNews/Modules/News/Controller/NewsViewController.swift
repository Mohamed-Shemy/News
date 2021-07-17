//
//  NewsViewController.swift
//  WWNews
//
//  Created by Mohamed Shemy on Sat 17 Jul 2021.
//  Copyright © 2021 Mohamed Shemy. All rights reserved.
//

import KafkaRefresh

class NewsViewController: UIViewController
{
    // MARK:- Outlets
    
    @IBOutlet weak var articlesTableView: UITableView!
    
    // MARK:- Properties
    
    var interactor: NewsInteractorDelegate?
    var router: NewsRouter?
    private var country: String
    
    // MARK:- init
    
    init(_ country: String)
    {
        self.country = country
        super.init(nibName: Self.identifier, bundle: nil)
        setupComponants()
    }
    
    required init?(coder: NSCoder)
    {
        fatalError("use init(_:)")
    }
    
    // MARK:- Life Cycel
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        setup()
        getTopHeadlines()
    }
    
    // MARK:- Setup
    
    private func setupComponants()
    {
        let presenter = NewsPresenter()
        let interactor = NewsInteractor()
        let router = NewsRouter(self)
        
        presenter.view = self
        interactor.presenter = presenter
        self.interactor = interactor
        self.router = router
    }
    
    private func setup()
    {
        title = "News"
        setupArticlesTableView()
        setupSearchController()
        setupTableViewFooterActivityIndicator()
    }
    
    private func setupArticlesTableView()
    {
        articlesTableView.register(nib: ArticleTableViewCell.self)
    }
    
    private func setupSearchController()
    {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search ..."
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    private func setupTableViewFooterActivityIndicator()
    {
        articlesTableView.bindFootRefreshHandler(footRefreshHandler, themeColor: .systemBlue, refreshStyle: .replicatorDot)
    }
    
    // MARK:- Methods
    
    private func getTopHeadlines()
    {
        interactor?.getTopHeadlines(in: country)
    }
    
    private func footRefreshHandler()
    {
        interactor?.loadMoreArticles()
    }
    
    private func stopFooterRefreshing()
    {
        articlesTableView.footRefreshControl.endRefreshing()
        articlesTableView.rowHeight = UITableView.automaticDimension
    }
    
    @objc func search(_ searchBar: UISearchBar)
    {
        guard let searchKey = searchBar.text else { return }
        
        interactor?.search(for: searchKey)
    }
}

// MARK:- UISearchResultsUpdating

extension NewsViewController: UISearchResultsUpdating
{
    func updateSearchResults(for searchController: UISearchController)
    {
        NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(search(_:)), object: searchController.searchBar)
        perform(#selector(search(_:)), with: searchController.searchBar, afterDelay: 0.5)
    }
}

// MARK:- NewsViewDelegate

extension NewsViewController: NewsViewDelegate
{
    func display(articles dataSource: ArticleDataSource)
    {
        stopFooterRefreshing()
        
        dataSource.cellHeight = -1
        dataSource.animationType = .scale()
        dataSource.delegate = self
        
        articlesTableView.dataSource = dataSource
        articlesTableView.delegate = dataSource
        articlesTableView.reloadData()
    }
    
    func handelEmptyResponse()
    {
        stopFooterRefreshing()
    }
    
    func display(error message: Alert)
    {
        stopFooterRefreshing()
        showAlert(.app, message)
    }
}

// MARK:- DataSourceDelegate

extension NewsViewController: DataSourceDelegate
{
    func didSelect(_ item: Any?, at indexPath: IndexPath)
    {
        guard let article = item as? ArticleViewModel else { return }
        
        articlesTableView.deselectRow(at: indexPath, animated: true)
        router?.navigate(to: .article(article))
    }
}
