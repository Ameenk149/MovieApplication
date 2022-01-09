//
//  ApiService.swift
//  iosMovieApplication
//
//  Created by Ameen on 03.01.22.
//

import Foundation


protocol ApiService {
    func request<Request: ApiRequest>(_ request: Request, completion: @escaping (Result<Request.Result, Error>) -> Void)
}

final class DefaultNetworkService: ApiService {
    
    
    private var apiClient: APIClientProtocol = APIClientURLSession()
    
 
    func request<Request: ApiRequest>(_ request: Request, completion: @escaping (Result<Request.Result, Error>) -> Void) {
    
    
        guard var urlComponent = URLComponents(string: request.url) else {
            let error = NSError(
                domain: ErrorResponse.invalidEndpoint.rawValue,
                code: 404,
                userInfo: nil
            )
            
            return completion(.failure(error))
        }
        
        
        var queryItems: [URLQueryItem] = []
        
        request.queryItems.forEach {
            let urlQueryItem = URLQueryItem(name: $0.key, value: $0.value)
            urlComponent.queryItems?.append(urlQueryItem)
            queryItems.append(urlQueryItem)
        }
        
        urlComponent.queryItems = queryItems
        
        
        guard let url = urlComponent.url else {
            let error = NSError(
                domain: ErrorResponse.invalidEndpoint.rawValue,
                code: 404,
                userInfo: nil
            )
            
            return completion(.failure(error))
        }

        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.method.rawValue
        urlRequest.allHTTPHeaderFields = request.headers
        
        apiClient.dataTask(urlRequest) { URLResponse in
            switch URLResponse {
            case .failure(_):
                return completion(.failure(NSError()))
            case .success(let serverResponse):
                do {
                    try completion(.success(request.decodeJSON(serverResponse.data)))
                }
             catch let error {
                    completion(.failure(error))
                }
            }
        }
        
    }
}
