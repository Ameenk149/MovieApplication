//
//  Constants.swift
//  iosMovieApplication
//
//  Created by Ameen on 08.01.22.
//

import Foundation

struct Constants {
   
    struct Network {
        
        struct Authentication {
            static let apiKey = "c9856d0cb57c3f14bf75bdc6c063b8f3"
        }
        struct URL {
            static let baseUrl = "https://api.themoviedb.org/3"
            static let getTrendinMoviePath = "/discover/movie"
            static let getMovieDetails = "/movie/"
        }
  }
    struct ErrorResponses {
        static let apiError = "It seems there is a problem with the request"
        static let invalidEndpoint = "It seems there is a problem with the endpoint"
        static let invalidResponse = "It seems there is a problem with the response"
        static let noData = "It seems there is a problem with the data"
        static let serializationError = "It seems there is a problem with the serialization"
    }
    struct Views {
        struct Storyboards {
            static let storyboard = "Main"
            static let launchScreen = "launchScreen"
        }
        struct ViewControllers {
            static let trendingMoviesViewController = "TrendingMoviesViewController"
            static let movieDetailsViewController = "MovieDetailsViewController"
        }
        struct Xibs {
            static let trendingMovieCollectionViewCell = "TrendingMovieCollectionViewCell"
            static let headerMovieDetailsTableViewCell = "MovieDetailsHeaderViewCell"
            static let releaseDateMovieDetailsTableViewCell = "ReleaseDateTableViewCell"
            static let overviewMovieDetailsTableViewCell = "OverviewTableViewCell"
        }
    }
    
        
}
