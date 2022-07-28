//
//  MovieCell.swift
//  Kinopoisk
//
//  Created by Olzhas Seiilkhanov on 16.05.2022.
//

import UIKit

class MovieCell: UITableViewCell {
    @IBOutlet var movieImageView: UIImageView!
    @IBOutlet var movieTitleLable: UILabel!
    @IBOutlet var movieDateLabel: UILabel!
    @IBOutlet var movieRating: UILabel!
    
    func setUp(with movie: Movie) {
        movieTitleLable.text = movie.originalTitle
        movieDateLabel.text = movie.releaseDate
        movieRating.text = "★" + String(format: "%.1f", movie.voteAverage!)
        
        let url = URL(string: movie.posterUrl ?? "")
        movieImageView.kf.setImage(with: url)
        
        if movie.voteAverage! < 4 {
            movieRating.backgroundColor = UIColor.systemRed
        } else if movie.voteAverage! < 7 {
            movieRating.backgroundColor = UIColor.systemOrange
        } else {
            movieRating.backgroundColor = UIColor.systemGreen
        }
    }
}
