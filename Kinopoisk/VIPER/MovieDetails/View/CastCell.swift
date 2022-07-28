//
//  CastCell.swift
//  Kinopoisk
//
//  Created by Olzhas Seiilkhanov on 17.05.2022.
//

import UIKit

class CastCell: UICollectionViewCell {
    @IBOutlet var castImageView: UIImageView!
    @IBOutlet var castName: UILabel!
    @IBOutlet var castStatus: UILabel!
    
    func setUp(with cast: PersonEntity) {
        castName.text = cast.name
        castStatus.text = cast.known_for_department
        
        let url = URL(string: "https://image.tmdb.org/t/p/w200\(cast.profile_path)")
        castImageView.kf.setImage(with: url)
    }
}
