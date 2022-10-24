//
//  NewsModel.swift
//  NewsProject
//
//  Created by Utku Çetinkaya on 7.09.2022.
//

import Foundation

struct APIResponse: Codable {
    let articles: [Article]
}

struct Article: Codable {
    let title: String
    let url: String
    let urlToImage: String?
    let description: String?
}
