//
//  MovieCell.swift
//  MobileDevelopment
//
//  Created by Bogdan Pinkavsky
//

import UIKit

class MovieCell: UITableViewCell {
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieTitleView: UILabel!
    @IBOutlet weak var movieYearView: UILabel!
    @IBOutlet weak var movieTypeView: UILabel!
    
    func setMovie(movie: Movie) {
        movieImageView.image = movie.image
        movieTitleView.text = movie.title
        movieYearView.text = movie.year
        movieTypeView.text = movie.type
    }
}
