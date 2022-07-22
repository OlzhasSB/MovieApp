//
//  MovieNewsPresenter.swift
//  Kinopoisk
//
//  Created by Olzhas Seiilkhanov on 22.07.2022.
//

import Foundation

final class MovieNewsPresenter: MovieNewsInteractorOutput, MovieNewsViewOutput, MovieNewsModuleInput {
    
    weak var view: MovieNewsViewInput!
    var interactor: MovieNewsInteractorInput!
    var router: MovieNewsRouterInput!
    
    private var movies: [Movie] = []
    
    func configure(with movies: [Movie]) {
        self.movies = movies
    }
    
    func didLoadView() {
        interactor.obtainGenres()
        view.handleSortedMovies(movies)
    }
    
    func didSelectGenreCell(at genreId: Int) {
        interactor.sortByGenre(wiht: genreId, in: movies)
    }
    
    func didSelectMovieCell(at movie: Movie) {
        router.openMovieDetailsModule(with: movie)
    }
    
    func didSortMovies(_ sortedMovies: [Movie]) {
        view.handleSortedMovies(sortedMovies)
    }
    
    func didLoadGenres(_ genres: [Genre]) {
        view.handleObtainedGenres(genres)
    }
    
}
