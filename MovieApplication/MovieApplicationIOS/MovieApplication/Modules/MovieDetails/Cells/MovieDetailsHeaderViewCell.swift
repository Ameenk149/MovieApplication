//
//  MovieDetailsHeaderViewCell.swift
//  iosMovieApplication
//
//  Created by Ameen on 09.01.22.
//

import UIKit

class MovieDetailsHeaderViewCell: UITableViewCell {

    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var tagline: UILabel!
    @IBOutlet weak var headerImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    // All the data population regards to view cell is in its view class.
    func populateCell(data: MovieDetailsViewModel?){
        
        self.movieTitle.text = data?.title
        self.tagline.text = data?.tagline
        guard let imageURL = data?.posterPath else {
            return
        }
        ImageClient.shared.setImage(from: imageURL, placeholderImage: nil) { [weak self] image in
            self?.headerImage.image = image
        }
    }
    
}

