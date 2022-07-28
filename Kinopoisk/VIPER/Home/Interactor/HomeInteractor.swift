//
//  HomeInteractor.swift
//  Kinopoisk
//
//  Created by Olzhas Seiilkhanov on 25.07.2022.
//

import Foundation

protocol HomeInteractorInput {
    func obtainMovies()
}

protocol HomeInteractorOutput: AnyObject {
    func didLoadMovies(_ movies: [[Movie]])
}

final class HomeInteractor: HomeInteractorInput {
    
    weak var output: HomeInteractorOutput?
    private var networkManager: Networkable
    
    required init(networkManager: Networkable) {
        self.networkManager = networkManager
    }
    
    func obtainMovies() {
        var sectionMovies: [[Movie]] = []
        networkManager.loadTodayMovies { movies in
            sectionMovies.append(movies)
        }
        networkManager.loadSoonMovies { movies in
            sectionMovies.append(movies)
        }
        networkManager.loadTrendingMovies { movies in
            sectionMovies.append(movies)
        }
        output?.didLoadMovies(sectionMovies)
    }
    
}
