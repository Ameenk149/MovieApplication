//
//  MovieResponses.swift
//  iosMovieApplication
//
//  Created by Ameen on 08.01.22.
//

import Foundation
import UIKit

struct Movie: Codable {
     let id: Int?
     let title: String?
     let posterPath: String?
     let overview: String?
     var downloadedImages: UIImage?
    
     enum CodingKeys: String, CodingKey {
        case id
        case title
        case posterPath
        case overview
    }
}

struct MovieResponse: Codable {
     let page: Int
     let totalResults: Int
     let totalPages: Int
     let results: [Movie]
}

struct MovieDetailResponse: Codable {
    let results: MovieDetails
}

struct MovieDetails: Codable {
    let id: Int?
    let title: String?
    let tagline: String?
    let overview: String?
    let releaseDate: String?
    let backdropPath: String?
    let originalLanguage: String?
    let posterPath: String?
    
}

