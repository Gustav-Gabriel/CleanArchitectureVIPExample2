//
//  PokemonsPresenter.swift
//  CleanArquitectureVIPExample
//
//  Created by Gustavo Gelabert Gabriel on 22/01/21.
//

import Foundation

protocol PokemonsPresenterProtocol {
    func setPokemonList(pokemonList: PokemonListResponse)
    func setupPokemonTableView()
    func showErrorDialog()
}

class PokemonsPresenter : PokemonsPresenterProtocol {
    var viewController: PokemonsViewController?

    init() {}

    func setPokemonList(pokemonList: PokemonListResponse) {
        viewController?.pokemonList = pokemonList
    }

    func setupPokemonTableView() {
        viewController?.setupTableView()
    }

    func showErrorDialog() {
        viewController?.showError()
    }
}
