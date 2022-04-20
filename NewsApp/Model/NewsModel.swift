//
//  NewsModel.swift
//  NewsApp
//
//  Created by Utku on 19.04.2022.
//

import Foundation


// MARK: - NewsElement
struct NewsElement: Codable {
    var id: Int?
    var title: String?
    var url: String?
    var imageURL: String?
    var newsSite, summary, publishedAt, updatedAt: String?
    var featured: Bool?
    var launches: [Launch]?
    var events: [Event]?

    enum CodingKeys: String, CodingKey {
        case id, title, url
        case imageURL = "imageUrl"
        case newsSite, summary, publishedAt, updatedAt, featured, launches, events
    }
}

// MARK: - Event
struct Event: Codable {
    var id: Int?
    var provider: String?
}

// MARK: - Launch
struct Launch: Codable {
    var id, provider: String?
}

typealias News = [NewsElement]
