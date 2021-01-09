//
//  ArticleWrapperModel.swift
//  GoodNews
//
//  Created by Juan Bonforti on 09/01/2021.
//

import Foundation

struct ArticleWrapperModel: Decodable {
    let status: String
    let totalResults: Int
    let articles: [ArticleModel]
}
