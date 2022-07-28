//
//  HomeModuleAssembly.swift
//  Kinopoisk
//
//  Created by Olzhas Seiilkhanov on 25.07.2022.
//

import UIKit

//typealias HomeModuleConfiguration = () -> Void

final class HomeModuleAssembly {
    func assemble() -> UIViewController {
        let dataDisplayManager = HomeDataDisplayManager()
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let viewController = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        let presenter = HomePresenter()
        let network: Networkable = AlamofireNetworkManager.shared
        let interactor = HomeInteractor(networkManager: network)
        let router = HomeRouter()
        
//        configuration?(presenter)
        
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
