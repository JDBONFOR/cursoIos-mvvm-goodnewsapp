import Foundation
import UIKit
import RxSwift
import RxCocoa

class NewsListTableViewController: UITableViewController {
    
    // MARK: - Vars
    private var viewModel: ArticleListViewModel!
    private let disposeBag = DisposeBag()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        fetchData()
    }
}

// MARK: - Private Methods
private extension NewsListTableViewController {
    
    func setupUI() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func fetchData() {
        
        URLRequest.load(resource: ArticleWrapperModel.all)
            .subscribe(onNext: { result in
                if let result = result {
                    self.viewModel = ArticleListViewModel(articles: result.articles)
                    
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
            }).disposed(by: disposeBag)
    }
}

// MARK: - Extensions
extension NewsListTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.viewModel == nil ? 0 : self.viewModel.numberOfSections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.numberOfRowsInSection(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) as? ArticleCell else { fatalError("ArticleCell not found") }
        
        cell.setData(viewModel.articles[indexPath.row])
        return cell
    }
}
