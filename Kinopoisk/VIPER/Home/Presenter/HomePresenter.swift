//
//  HomePresenter.swift
//  Kinopoisk
//
//  Created by Olzhas Seiilkhanov on 25.07.2022.
//

import Foundation

final class HomePresenter: HomeViewOutput, HomeInteractorOutput {
    
    weak var view: HomeViewInput!
    var interactor: HomeInteractorInput!
    var router: HomeRouterInput!

//    private var movies: [Movie]!
    
    func didLoadView() {
        interactor.obtainMovies()
    }
    
    func didTapAllButton(at section: Int) {
//        router.openMovieNewsModule(with: movies) 
    }
    
    func didSelectMovieCell(with movieId: Int) {

    }
    
    func didLoadMovies(_ movies: [[Movie]]) {
        view.handleObtainedMovies(movies)
    }
    
    
}
