//
//  MovieDetailsRouter.swift
//  Kinopoisk
//
//  Created by Olzhas Seiilkhanov on 22.07.2022.
//

import UIKit

protocol MovieDetailsRouterInput {
    func openCastModule(with cast: PersonEntity)
}

final class MovieDetailsRouter: MovieDetailsRouterInput {
    weak var viewController: UIViewController?
    
    func openCastModule(with cast: PersonEntity) {
        // Create CastModuleAssembly
        let viewController = CastMemberModuleAssembly().assemble { (input) in
            input.configure(with: cast)
        }
        self.viewController?.navigationController?.pushViewController(viewController, animated: true)
    }
}
