//
//  HomeDataDisplayManager.swift
//  Kinopoisk
//
//  Created by Olzhas Seiilkhanov on 25.07.2022.
//

import UIKit

final class HomeDataDisplayManager: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    var sectionNames: [String] = ["Today at the cinema", "Soon at the cinema", "Trending movies"]
    var sectionMovies: [[Movie]] = []
    var genres: [Genre] = []
    var movies: [Movie] = []
    
    var onMovieDidSelect: ((Int) -> Void)?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sectionNames.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sectionCell") as! TableSectionCell
        if sectionMovies.count > 0 {
            cell.configure(with: (sectionNames[indexPath.row], movies: sectionMovies[indexPath.row]), genres: genres)
        }
//        cell.index = indexPath.row
//        cell.delegate = self
        return cell
    }
    
}

extension HomeDataDisplayManager: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 128, height: 270)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieCell", for: indexPath) as! CollectionSectionCell
        cell.setUp(with: movies[indexPath.row], genres: genres)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        onMovieDidSelect?(movies[indexPath.row].id)
//        delegate?.showDescription(for: index, id: indexPath.row)
    }
    
}
