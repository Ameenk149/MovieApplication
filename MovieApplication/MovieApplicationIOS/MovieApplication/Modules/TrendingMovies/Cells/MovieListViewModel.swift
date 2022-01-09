//
//  TrendingMovieListModel.swift
//  iosMovieApplication
//
//  Created by Ameen on 03.01.22.
//

import UIKit

protocol MovieListViewModel {
    var movie: MovieViewModel { set get }
}

final class MovieDefaultListModel: MovieListViewModel {
    
    var movie: MovieViewModel
    
    init(movie: MovieViewModel) {
        self.movie = movie
    }
}
