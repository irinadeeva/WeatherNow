//
//  NetworkError.swift
//  WeatheNow
//
//  Created by Irina Deeva on 26/10/24.
//

import Foundation

public enum NetworkError: Error {
    case codeError
    case noData
    case invalidResponse
    case requestError(Error)
    case invalidRequest
    
    var errorDescription: String {
        switch self {
        case .requestError:
            return "A network request error occurred. Please check your connection or try again later."
        case .codeError:
            return "The server returned an invalid response code. Please try again later."
        case .noData:
            return "No data was received from the server. Please try again later."
        case .invalidResponse:
            return "Data processing error. Please contact the developer."
        case .invalidRequest:
            return "Failed to create the request. Please check the provided location or try again later."
        }
    }
}
