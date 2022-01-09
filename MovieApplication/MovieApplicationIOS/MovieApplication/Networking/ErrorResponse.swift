//
//  ErrorResponse.swift
//  iosMovieApplication
//
//  Created by Ameen on 03.01.22.
//


import Foundation

enum ErrorResponse: String {
    case apiError
    case invalidEndpoint
    case invalidResponse
    case noData
    case serializationError
    
    public var description: String {
        switch self {
        case .apiError: return Constants.ErrorResponses.apiError
        case .invalidEndpoint: return Constants.ErrorResponses.invalidEndpoint
        case .invalidResponse: return Constants.ErrorResponses.invalidResponse
        case .noData: return Constants.ErrorResponses.noData
        case .serializationError: return Constants.ErrorResponses.serializationError
        }
    }
}
