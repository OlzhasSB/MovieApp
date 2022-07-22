//
//  MovieNewsRouter.swift
//  Kinopoisk
//
//  Created by Olzhas Seiilkhanov on 22.07.2022.
//

import UIKit

protocol MovieNewsRouterInput {
    func openMovieDetailsModule(with movie: Movie)
}

final class MovieNewsRouter: MovieNewsRouterInput {
    weak var viewController: UIViewController?
    
    func openMovieDetailsModule(with movie: Movie) {
        let viewController = MovieDetailsModuleAssembly().assemble { (input) in
            input.configure(with: movie)
        }
        self.viewController?.navigationController?.pushViewController(viewController, animated: true)
    }
}
