//
//  MovieDetailsViewModel.swift
//  iosMovieApplication
//
//  Created by Ameen on 07.01.22.
//

import Foundation
import UIKit

protocol MovieDetailsViewModelProtocol : AnyObject {
    var movieDetailsViewModel : MovieDetailsViewModel? { get }
    var success: (() -> Void)? { set get }
    var failure: ((Error) -> Void)? { set get }
    func getDetails(movieId: Int)
}

final class MovieDetailsDefaultViewModel: MovieDetailsViewModelProtocol {
    private let apiService: ApiService
    private let movie: Movie
    
    init(apiService: ApiService, movie: Movie) {
        self.apiService = apiService
        self.movie = movie
    }
    
    var movieDetailsViewModel: MovieDetailsViewModel?
    var movieDetails: MovieDetails?
    var success: (() -> Void)?
    var failure: ((Error) -> Void)?
    
    //Calls the api of the movie details and returns the response of the request.
    func getDetails(movieId: Int) {
        let request = MovieDetailsApi(id: movieId)
        apiService.request(request) { [weak self] result in
            switch result {
            case .success(let movieDetails):
                self?.handleSuccessResponse(movieDetails: movieDetails)
               
            case .failure(let error):
                self?.failure?(error)
            }
        }
    }
    
    //Handles the succes response of the movie details
    func handleSuccessResponse(movieDetails: MovieDetails) {
        self.movieDetails = movieDetails
        guard let title = movieDetails.title,
                  let tagline  = movieDetails.tagline,
                  let overview = movieDetails.overview,
                  let releaseDate = movieDetails.releaseDate,
                  let posterPath = movieDetails.posterPath
            else { return }
            
        let posterURL = "https://image.tmdb.org/t/p/w500\(posterPath)"
        
        let viewModel = MovieDetailsViewModel(title: title, tagline: tagline, overview: overview, releaseDate: releaseDate, posterPath: posterURL)
       movieDetailsViewModel = viewModel
        success?()
    }
}
