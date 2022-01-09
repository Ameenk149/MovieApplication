//
//  TrendingMovieCollectionViewCell.swift
//  iosMovieApplication
//
//  Created by Ameen on 03.01.22.
//

import UIKit

class TrendingMovieCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var moviePoster: UIImageView!
    @IBOutlet weak var movieNameBackgroundView: UIView!
    @IBOutlet weak var movieName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        moviePoster.layer.cornerRadius = 30
        movieNameBackgroundView.layer.cornerRadius = 20
        
    }

    func populateCell(data: MovieListViewModel){
        let movie = data.movie
        movieName.text = movie.title
        ImageClient.shared.setImage(from: movie.posterURL, placeholderImage: nil) { [weak self] image in
            self?.moviePoster.image = image
        }
    }
}
