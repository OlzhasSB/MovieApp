//
//  MovieNewsDataDisplayManager.swift
//  Kinopoisk
//
//  Created by Olzhas Seiilkhanov on 22.07.2022.
//

import UIKit

class MovieNewsDataDisplayManager: NSObject, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var genres: [Genre] = []
    var sortedMovies: [Movie] = []
    
    var onMovieDidSelect: ((Movie) -> Void)?
    var onGenreDidSelect: ((Int) -> Void)?
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return genres.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "genreCell", for: indexPath) as! GenreCell
        cell.setUp(with: genres[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let genreId = genres[indexPath.row].id
        onGenreDidSelect?(genreId)
    }
}

extension MovieNewsDataDisplayManager: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        onMovieDidSelect?(sortedMovies[indexPath.row])
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sortedMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as! MovieCell
        cell.setUp(with: sortedMovies[indexPath.row])
        return cell
    }
}
