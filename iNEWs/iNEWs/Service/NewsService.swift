//
//  NewsService.swift
//  iNEWs
//
//  Created by Paulo Pinheiro on 9/5/23.
//

import Foundation
import Combine

protocol NewsService {
    func request(from endpoint: NewsAPI) -> AnyPublisher<NewsResponse, APIError> 
        
    }


struct NewsServiceImpl: NewsService {
    func request(from endpoint: NewsAPI) -> AnyPublisher<NewsResponse, APIError> {
        return URLSession
            .shared
            .dataTaskPublisher(for: endpoint.urlRequest)
            .receive(on: DispatchQueue.main)
            .mapError { _ in APIError.unknown}
            .flatMap{ data, response -> AnyPublisher<NewsResponse, APIError} in
        
        guard let response = response as? HTTPURLResponse else {
            return Fail(error: APIError.unknown).eraseToAnyPublisher()
        }
        
        if (200...299).contains(response.statusCode) {
            return Just(data).decode(type: NewsResponse, decoder: <#T##TopLevelDecoder#>)
        } else {
            return Fail(error: APIError.errorCode(response.statusCode)).eraseToAnyPublisher()
        }
        .eraseToAnyPublisher()
        
    }
}


