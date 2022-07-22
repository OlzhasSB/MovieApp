//
//  MovieNewsInteractor.swift
//  Kinopoisk
//
//  Created by Olzhas Seiilkhanov on 22.07.2022.
//

import Foundation

protocol MovieNewsInteractorInput {
    func obtainGenres()
    func sortByGenre(wiht genreId: Int, in movies: [Movie])
}

protocol MovieNewsInteractorOutput: AnyObject {
    func didLoadGenres(_ genres: [Genre])
    func didSortMovies(_ sortedMovies: [Movie])
}

final class MovieNewsInteractor: MovieNewsInteractorInput {
    
    weak var output: MovieNewsInteractorOutput?
    private var networkManager: Networkable
    
    required init(networkManager: Networkable) {
        self.networkManager = networkManager
    }
    
    func obtainGenres() {
        networkManager.loadGenres { [weak self] genres in
            self?.output?.didLoadGenres(genres)
        }
    }
    
    func sortByGenre(wiht genreId: Int, in movies: [Movie]) {
        var sortedMovies: [Movie] = []
        for movie in movies {
            if movie.genreIds.contains(genreId) {
                sortedMovies.append(movie)
            }
        }
        self.output?.didSortMovies(sortedMovies)
    }
    
}
