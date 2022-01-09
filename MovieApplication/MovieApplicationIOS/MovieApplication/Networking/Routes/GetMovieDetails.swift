//
//  TrendingMoviesApi.swift
//  iosMovieApplication
//
//  Created by Ameen on 03.01.22.
//

import Foundation

struct MovieDetailsApi: ApiRequest {
    
    
   
    var id: Int
    
    private let apiKey: String = Constants.Network.Authentication.apiKey

    var url: String {
        let baseURL: String = Constants.Network.URL.baseUrl
        let path: String = Constants.Network.URL.getMovieDetails
        return baseURL + path + "\(id)"
    }
    
    var queryItems: [String : String] {
        [
            "api_key": apiKey
        ]
    }
    
    var method: HTTPMethod {
        .get
    }
    
    func decodeJSON(_ data: Data) throws -> MovieDetails {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-mm-dd"
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        
        let response = try decoder.decode(MovieDetails.self, from: data)
        return response
    }
}
