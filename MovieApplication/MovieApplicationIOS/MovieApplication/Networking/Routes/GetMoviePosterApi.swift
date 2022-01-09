//
//  getImage.swift
//  iosMovieApplication
//
//  Created by Ameen on 03.01.22.
//

import UIKit

struct ImageRequest: ApiRequest {
    
    let url: String
    
    var method: HTTPMethod {
        .get
    }
    
    func decodeJSON(_ data: Data) throws -> UIImage {
        guard let image = UIImage(data: data) else {
            throw NSError(
                domain: ErrorResponse.invalidResponse.rawValue,
                code: 13,
                userInfo: nil
            )
        }
        
        return image
    }
}
