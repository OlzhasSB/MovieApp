//
//  HomeRouter.swift
//  Kinopoisk
//
//  Created by Olzhas Seiilkhanov on 25.07.2022.
//

import UIKit

protocol HomeRouterInput {
    func openMovieNewsModule(with movies: [Movie])
}

final class HomeRouter: HomeRouterInput {
    weak var viewController: UIViewController?
    
    func openMovieNewsModule(with movies: [Movie]) {
        let viewController = MovieNewsModuleAssembly().assemble { (input) in
            input.configure(with: movies)
        }
        self.viewController?.navigationController?.pushViewController(viewController, animated: true)
    }
}
