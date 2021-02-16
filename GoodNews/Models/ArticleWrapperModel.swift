import Foundation

struct ArticleWrapperModel: Decodable {
    let status: String
    let totalResults: Int
    let articles: [ArticleModel]
}

extension ArticleWrapperModel {
    
    static var all: Resource<ArticleWrapperModel> = {
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=a4b7946a10bd498b93c3ee16b274bd58")!
        return Resource(url: url)
    }()
}
