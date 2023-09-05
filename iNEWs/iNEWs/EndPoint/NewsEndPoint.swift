//
//  NewsEndPoint.swift
//  iNEWs
//
//  Created by Paulo Pinheiro on 9/5/23.
//

import Foundation

protocol APIBuilder {
    var urlRequest: URLRequest { get }
    var baseURL: URL { get }
    var path: String { get }
    
}

enum NewsAPI {
    case getNews
}

extension NewsAPI: APIBuilder {
    
    var baseURL: URL {
        switch self {
        case .getNews:
            return URL(string: "https://api.lil.software")!
        }
    }
    
    var path: String {
        return "/news"
    }
    
    var urlRequest: URLRequest {
        return URLRequest(url: self.baseURL.appendingPathComponent(self.path))
    }
}
