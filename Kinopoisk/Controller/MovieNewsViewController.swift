//
//  ViewController.swift
//  Kinopoisk
//
//  Created by Olzhas Seiilkhanov on 16.05.2022.
//

import UIKit
import SwiftUI

class MovieNewsViewController: UIViewController {
    
    @IBOutlet private var myTableView: UITableView!
    @IBOutlet private var genreCollectionView: UICollectionView!
    
    private var networkManager = AlamofireNetworkManager.shared
    
    var sortedMovies: [Movie] = []
    var movies: [Movie] = [] {
        didSet {
            sortedMovies = movies
        }
    }
    private var genres: [Genre] = [] {
        didSet {
            genreCollectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "News"
        register()
        loadGenres()
    }
    
    private func register() {
        myTableView.delegate = self
        myTableView.dataSource = self
        genreCollectionView.dataSource = self
        genreCollectionView.delegate = self
    }
    
    private func sort(by genreId: Int) {
        sortedMovies.removeAll()
        for movie in movies {
            if movie.genreIds.contains(genreId) {
                sortedMovies.append(movie)
            }
        }
        myTableView.reloadData()
    }
}

// MARK: - TableView Delegates
extension MovieNewsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "MovieDetailsViewController") as? MovieDetailsViewController {
            vc.movie = sortedMovies[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
        }
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

// MARK: - CollectionView Delegates
extension MovieNewsViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return genres.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "genreCell", for: indexPath) as! GenreCell
        if genres.count > 0 {
            cell.setUp(with: genres[indexPath.row])
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let genreId = genres[indexPath.row].id
        sort(by: genreId)
    }
    
}

// MARK: - Network Call
extension MovieNewsViewController {
    
    private func loadGenres() {
        networkManager.loadGenres { [weak self] genres in
            self?.genres = genres
        }
    }
    
}
