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
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let castViewController = storyboard.instantiateViewController(withIdentifier: "CastMemberViewController") as? CastMemberViewController else { return }
        castViewController.cast = cast
        viewController?.navigationController?.pushViewController(castViewController, animated: true)
    }
}
