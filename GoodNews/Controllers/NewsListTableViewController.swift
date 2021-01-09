//
//  NewsListTableViewController.swift
//  GoodNews
//
//  Created by Juan Bonforti on 09/01/2021.
//

import Foundation
import UIKit

class NewsListTableViewController: UITableViewController {
    
    private var viewModel: ArticleListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

// MARK: - Extensions
extension NewsListTableViewController {
    
    private func setupUI() {
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=a4b7946a10bd498b93c3ee16b274bd58")!
        
        WebService().getArticles(url: url) { articles in
            if let articles = articles {
                self.viewModel = ArticleListViewModel(articles: articles)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
        
    }
}

extension NewsListTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.viewModel == nil ? 0 : self.viewModel.numberOfSections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.numberOfRowsInSection(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) as? ArticleCell else { fatalError("ArticleCell not found") }
        
        let articleVM = self.viewModel.articleAtIndex(indexPath.row)
        cell.titleLabel.text = articleVM.title
        cell.descriptionlabel.text = articleVM.description
        return cell
    }
}
