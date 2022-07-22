//
//  MovieDetailsPresenter.swift
//  Kinopoisk
//
//  Created by Olzhas Seiilkhanov on 22.07.2022.
//

import Foundation

final class MovieDetailsPresenter: MovieDetailsViewOutput, MovieDetailsInteractorOutput, MovieDetailsModuleInput {

    weak var view: MovieDetailsViewInput!
    var interactor: MovieDetailsInteractorInput!
    var router: MovieDetailsRouterInput!
    
    private var movie: Movie!
    
    func configure(with movie: Movie) {
        self.movie = movie
    }
    
    func didLoadView() {
        // Network запрос - interactor
        interactor.obtainMovieCast(with: movie)
    }
    
    func didSelectCastCell(at cast: PersonEntity) {
        // переход на экран CastViewController - router
        router.openCastModule(with: cast)
    }
    
    func didLoadMovieCast(_ cast: [PersonEntity]) {
        // notify view
        view.handleObtainedCast(cast)
        view.handleObtainedMovieDetails(movie)
    }
    
}
