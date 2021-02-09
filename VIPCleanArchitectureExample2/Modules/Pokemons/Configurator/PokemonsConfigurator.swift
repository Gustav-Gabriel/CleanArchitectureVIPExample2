
//
//  PokemonsConfigurator.swift
//  CleanArquitectureVIPExample
//
//  Created by Gustavo Gelabert Gabriel on 01/02/21.
//

import Foundation

class PokemonsConfigurator {
    static func configureModule(viewController: PokemonsViewController) {
        let router = PokemonsRounter()
        let worker = PokemonsWorker()
        let interactor = PokemonsInteractor(pokemonsWorker: worker)
        let presenter = PokemonsPresenter()

        viewController.router = router
        viewController.interactor = interactor

        interactor.presenter = presenter
        presenter.viewController = viewController

        router.navigationController = viewController.navigationController
    }
}
