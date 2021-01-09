//
//  WebServices.swift
//  GoodNews
//
//  Created by Juan Bonforti on 09/01/2021.
//

import Foundation

class WebService {
    
    func getArticles(url: URL, completion: @escaping ([ArticleModel]?) -> ()) {
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                
                let articlesWrapper = try? JSONDecoder().decode(ArticleWrapperModel.self, from: data)
                if let articlesWrapper = articlesWrapper {
                    completion(articlesWrapper.articles)
                }                
            }
            
        }.resume()
    }
}
