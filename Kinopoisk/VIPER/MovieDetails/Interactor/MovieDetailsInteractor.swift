//
//  MovieDetailsInteractor.swift
//  Kinopoisk
//
//  Created by Olzhas Seiilkhanov on 22.07.2022.
//

import Foundation

protocol MovieDetailsInteractorInput {
    func obtainMovieCast(with movie: Movie)
}

protocol MovieDetailsInteractorOutput: AnyObject {
    func didLoadMovieCast(_ cast: [PersonEntity]) 
}

final class MovieDetailsInteractor: MovieDetailsInteractorInput {
    
    weak var output: MovieDetailsInteractorOutput!
    private var networkManager: Networkable
    
    var creditsIds: [Actor] = []
    
    required init(networkManager: Networkable) {
        self.networkManager = networkManager
    }
    
    func obtainMovieCast(with movie: Movie) {
        
        var cast: [PersonEntity] = []
        let movieId = movie.id
        
        networkManager.getCredits(path: "/3/movie/\(movieId)/credits") { [weak self] ids in
//            self?.creditsIds = ids
            for id in ids {
                self?.networkManager.getCast(path: "/3/person/\(id.id)") { [weak self] person in
                    cast.append(person)
                    self?.output.didLoadMovieCast(cast)
                }
            }
        }
        

    }
    
}
