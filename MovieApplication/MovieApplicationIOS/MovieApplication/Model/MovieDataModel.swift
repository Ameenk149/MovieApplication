//
//  MovieDataModel.swift
//  iosMovieApplication
//
//  Created by Ameen on 03.01.22.
//

import UIKit

struct MovieDetailsViewModel {
 
    let title: String
    let tagline: String
    let overview: String
    let releaseDate: String
    let posterPath: String
    
    init(title: String, tagline: String, overview: String, releaseDate: String, posterPath: String) {
        self.title = title
        self.tagline = tagline
        self.overview = overview
        self.releaseDate = releaseDate
        self.posterPath = posterPath
    }
}

struct MovieViewModel {
    let title: String
    let posterURL: String
    private let didSelect: () -> Void
    
    init(title: String, posterURL: String, didSelect: @escaping () -> Void) {
        
        self.title = title
        self.posterURL = posterURL
        self.didSelect = didSelect
    }
    
    func didTap() {
        didSelect()
    }
}



