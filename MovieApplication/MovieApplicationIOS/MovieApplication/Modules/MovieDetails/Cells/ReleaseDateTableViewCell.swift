//
//  ReleaseDateTableViewCell.swift
//  iosMovieApplication
//
//  Created by Ameen on 09.01.22.
//

import UIKit

class ReleaseDateTableViewCell: UITableViewCell {

    @IBOutlet weak var releaseDate: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    // All the data population regards to view cell is in its view class.
    func populate(data: MovieDetailsViewModel?) {
        self.releaseDate.text = data?.releaseDate
    }
    
}
