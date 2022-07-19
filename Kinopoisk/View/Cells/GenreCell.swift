//
//  GenreCell.swift
//  Kinopoisk
//
//  Created by Olzhas Seiilkhanov on 20.05.2022.
//

import UIKit

class GenreCell: UICollectionViewCell {
    @IBOutlet var genreLabel: UILabel!
    
    func setUp(with genre: Genre) {
        genreLabel.text = genre.name
    }
    
   // genreLabel.layer.masksToBounds
    
}
