//
//  MovieDetailsModuleAssembly.swift
//  Kinopoisk
//
//  Created by Olzhas Seiilkhanov on 22.07.2022.
//

import UIKit

protocol MovieDetailsModuleInput {
    func configure(with movie: Movie)
}

typealias MovieDetailsModuleConfiguration = (MovieDetailsModuleInput) -> Void

final class MovieDetailsModuleAssembly {
    func assemble(_ configuration: MovieDetailsModuleConfiguration? = nil) -> MovieDetailsViewController {
        let dataDisplayManager = MovieDetailsDataDisplayManager()
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let viewController = storyboard.instantiateViewController(withIdentifier: "MovieDetailsViewController") as! MovieDetailsViewController
        let presenter = MovieDetailsPresenter()
        let network: Networkable = AlamofireNetworkManager.shared
        let interactor = MovieDetailsInteractor(networkManager: network)
        let router = MovieDetailsRouter()
        
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
