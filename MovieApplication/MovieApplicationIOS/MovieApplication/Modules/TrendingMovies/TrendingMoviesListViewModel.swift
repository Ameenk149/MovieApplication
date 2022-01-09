//
//  ListViewModel.swift
//  iosMovieApplication
//
//  Created by Ameen on 03.01.22.
//

import Foundation

protocol TrendingMoviesViewModelProtocol: AnyObject {
    var moviesViewModel: [MovieViewModel] { set get }
    var success: (() -> Void)? { set get }
    var failure: ((Error) -> Void)? { set get }
    var moveToDetails: ((Movie) -> Void)? { set get }
    func getMovies()
    
}

final class TrendingMoviesViewModel: TrendingMoviesViewModelProtocol {
    
    private let apiService: ApiService
    
    init(apiService: ApiService) {
        self.apiService = apiService
    }
    var moviesViewModel: [MovieViewModel] = []
    var movies: [Movie] = []
    var success: (() -> Void)?
    var failure: ((Error) -> Void)?
    
    
    var moveToDetails: ((Movie) -> Void)?
    
    func getMovies() {
        let request = TrendingMoviesApi()
        apiService.request(request) { [weak self] result in
            switch result {
            case .success(let movies):
                self?.handleSuccessResponse(movies: movies)
            case .failure(let error):
                self?.failure?(error)
            }
        }
    }
    
    func handleSuccessResponse(movies: [Movie]) {
        self.movies = movies
        
        movies.forEach({ item in
            guard let title = item.title,
            let posterPath = item.posterPath
            else { return }
            
            //Make constants file
            let posterURL = "https://image.tmdb.org/t/p/w500\(posterPath)"
            let viewModel = MovieViewModel(title: title, posterURL: posterURL,
                                           didSelect: { [weak self] in
                
                self?.moveToDetails?(item)
                
                
                
            })
            
            moviesViewModel.append(viewModel)
            
        })
            
        
        success?()
    }
    
}
