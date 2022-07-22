//
//  MovieDetailsDataDisplayManager.swift
//  Kinopoisk
//
//  Created by Olzhas Seiilkhanov on 20.07.2022.
//

import UIKit

final class MovieDetailsDataDisplayManager: NSObject, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var cast: [PersonEntity] = []
    var onCastMemberDidSelect: ((PersonEntity) -> Void)?
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cast.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! CastCell
//        if cast.count > 0 {
            cell.setUp(with: cast[indexPath.row])
//        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        onCastMemberDidSelect?(cast[indexPath.row])
    }
}
