//
//  NewResponse.swift
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
struct NewResponse: Codable {
    let articles: [Article]
}

// MARK: - Article
struct Article: Codable, Identifiable {
    var id = UUID()
    let author: String?
    let url: String
    let source, title, description: String
    let image: String?
    let date: Date
    
    enum CondiingKeys: String, CodingKey {
        case author, url, source, title
        case articleDescription = "description"
        case image, date
    }
}
