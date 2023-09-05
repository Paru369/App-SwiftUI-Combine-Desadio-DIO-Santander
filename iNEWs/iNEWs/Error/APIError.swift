//
//  APIError.swift
//  iNEWs
//
//  Created by Paulo Pinheiro on 9/5/23.
//

import Foundation


enum APIError: Error {
    case decodingError
    case errorCode(Int)
    case unknown
}

extension APIError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .decodingError:
            return "Failed to decode"
        case .errorCode(let code):
            return "\(code) - Somenthing went wrong"
        case .unknown:
            return "A Unkown error appears"
        }
    }
}
