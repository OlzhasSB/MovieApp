//
//  ViewController.swift
//  Kinopoisk
//
//  Created by Olzhas Seiilkhanov on 16.05.2022.
//

import UIKit
import SwiftUI

protocol MovieNewsViewInput: AnyObject {
    func handleObtainedGenres(_ genres: [Genre])
    func handleSortedMovies(_ movies: [Movie])
}

protocol MovieNewsViewOutput {
    func didLoadView()
    func didSelectMovieCell(at movie: Movie)
    func didSelectGenreCell(at genreId: Int)
}

class MovieNewsViewController: UIViewController {
    
    var output: MovieNewsViewOutput?
    var dataDisplayManager: MovieNewsDataDisplayManager?
    
    @IBOutlet private var myTableView: UITableView!
    @IBOutlet private var genreCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "News"
        configureTableCollectionViews()
        output?.didLoadView()
    }
    
    private func configureTableCollectionViews() {
        dataDisplayManager?.onMovieDidSelect = { [weak self] movie in
            self?.output?.didSelectMovieCell(at: movie)
        }
        dataDisplayManager?.onGenreDidSelect = { [weak self] genreId in
            self?.output?.didSelectGenreCell(at: genreId)
        }
        myTableView.delegate = dataDisplayManager
        myTableView.dataSource = dataDisplayManager
        genreCollectionView.dataSource = dataDisplayManager
        genreCollectionView.delegate = dataDisplayManager
    }
    
}

extension MovieNewsViewController: MovieNewsViewInput {
    
    func handleObtainedGenres(_ genres: [Genre]) {
        dataDisplayManager?.genres = genres
        genreCollectionView.reloadData()
    }
    
    func handleSortedMovies(_ movies: [Movie]) {
        dataDisplayManager?.sortedMovies = movies
        myTableView.reloadData()
    }
    
}
