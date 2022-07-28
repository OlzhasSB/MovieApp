//
//  CastMemberModuleAssembly.swift
//  Kinopoisk
//
//  Created by Olzhas Seiilkhanov on 25.07.2022.
//

import UIKit

protocol CastMemberModuleInput {
    func configure(with cast: PersonEntity)
}

typealias CastMemberModuleConfiguration = (CastMemberModuleInput) -> Void

final class CastMemberModuleAssembly {
    func assemble(_ configuration: CastMemberModuleConfiguration? = nil) -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let viewController = storyboard.instantiateViewController(withIdentifier: "CastMemberViewController") as! CastMemberViewController
        let presenter = CastMemberPresenter()
//        let network: Networkable = AlamofireNetworkManager.shared
//        let interactor = MovieDetailsInteractor(networkManager: network)
//        let router = MovieDetailsRouter()
        
        configuration?(presenter)
        
        viewController.output = presenter
        
        presenter.view = viewController
//        presenter.interactor = interactor
//        presenter.router = router
        
//        interactor.output = presenter
        
//        router.viewController = viewController
        
        return viewController
    }
}
