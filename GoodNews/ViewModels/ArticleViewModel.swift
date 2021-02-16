import Foundation

// List of Articles
struct ArticleListViewModel: Decodable {
    let articles: [ArticleModel]
}

extension ArticleListViewModel {
    var numberOfSections: Int { return 1 }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        return self.articles.count
    }
    
    func articleAtIndex(_ index: Int) -> ArticleViewModel {
        let article = self.articles[index]
        return ArticleViewModel(article)
    }
}

// 1 article
struct ArticleViewModel {
    private let article: ArticleModel
}

extension ArticleViewModel {
    init(_ article: ArticleModel) {
        self.article = article
    }
}

extension ArticleViewModel {
    var title: String {
        return self.article.title
    }
    var description: String {
        return self.article.description ?? ""
    }
}
