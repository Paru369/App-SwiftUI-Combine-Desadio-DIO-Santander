//
//  NewsResponse.swift
//  iNEWs
//
//  Created by Paulo Pinheiro on 9/5/23.
//


// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let fluctuationObject = try? JSONDecoder().decode(FluctuationObject.self, from: jsonData)

import Foundation

// MARK: - FluctuationObject
struct ArticleResponse: Codable {
    let articles: [Article]
}

struct Article: Codable, Identifiable {

    let id: UUID = UUID()
    var author: String?
    var url: String?
    var source: String?
    var title: String?
    var welcomeDescription: String?
    var image: String?
    var date: Date?

    enum CodingKeys: String, CodingKey {
        case author, url, source, title, image, date
        case welcomeDescription = "description"
    }
}

