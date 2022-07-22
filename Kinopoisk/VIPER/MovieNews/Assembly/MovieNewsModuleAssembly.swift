//
//  MovieNewsModuleAssembly.swift
//  Kinopoisk
//
//  Created by Olzhas Seiilkhanov on 22.07.2022.
//

import UIKit

protocol MovieNewsModuleInput {
    func configure(with movies: [Movie])
}

typealias MovieNewsModuleConfiguration = (MovieNewsModuleInput) -> Void

final class MovieNewsModuleAssembly {
    func assemble(_ configuration: MovieNewsModuleConfiguration? = nil) -> MovieNewsViewController {
        let dataDisplayManager = MovieNewsDataDisplayManager()
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let viewController = storyboard.instantiateViewController(withIdentifier: "MovieNewsViewController") as! MovieNewsViewController
        let presenter = MovieNewsPresenter()
        let network: Networkable = AlamofireNetworkManager.shared
        let interactor = MovieNewsInteractor(networkManager: network)
        let router = MovieNewsRouter()
        
        configuration?(presenter)
        
        viewController.dataDisplayManager = dataDisplayManager
        viewController.output = presenter
        
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.output = presenter
        
        router.viewController = viewController
        
        return viewController
    }
}
