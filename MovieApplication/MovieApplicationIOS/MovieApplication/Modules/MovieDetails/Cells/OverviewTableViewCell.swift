//
//  OverviewTableViewCell.swift
//  iosMovieApplication
//
//  Created by Ameen on 09.01.22.
//

import UIKit

class OverviewTableViewCell: UITableViewCell {
    @IBOutlet weak var overview: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
   
    // All the data population regards to view cell is in its view class.
    func populate(data: MovieDetailsViewModel?){
        self.overview.text = data?.overview
    }
}
