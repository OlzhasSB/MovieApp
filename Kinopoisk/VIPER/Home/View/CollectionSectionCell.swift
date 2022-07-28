//
//  CollectionSectionCell.swift
//  Kinopoisk
//
//  Created by Olzhas Seiilkhanov on 24.05.2022.
//

import UIKit
import Kingfisher

class CollectionSectionCell: UICollectionViewCell {
    @IBOutlet var posterImageView: UIImageView!
    @IBOutlet var genreLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var ratingLabel: UILabel!
    @IBOutlet var ratingView: UIView!
    
    func setUp(with movie: Movie, genres: [Genre]) {
        
        let url = URL(string: movie.posterUrl ?? "")
        posterImageView.kf.setImage(with: url)
        
        titleLabel.text = movie.originalTitle
        ratingLabel.text = "★" + String(format: "%.1f", movie.voteAverage ?? 0)
        
        guard let voteAverage = movie.voteAverage else { return }
        
        if voteAverage < 4 {
            ratingView.backgroundColor = UIColor.systemRed
        } else if voteAverage < 7 {
            ratingView.backgroundColor = UIColor.systemOrange
        } else {
            ratingView.backgroundColor = UIColor.systemGreen
        }
        
        genreLabel.text = getGenres(by: movie.genreIds, genres: genres)
        
    }
    
    func getGenres(by ids: [Int], genres: [Genre]) -> String? {
        var array: [String] = []
        for id in ids {
            array.append(genres.first { $0.id == id }?.name ?? "")
        }
        return array.joined(separator: ", ")
    }
    
}
