//
//  PokemonsInteractor.swift
//  CleanArquitectureVIPExample
//
//  Created by Gustavo Gelabert Gabriel on 22/01/21.
//

import Foundation

protocol PokemonsInteractorProtocol {
    var presenter: PokemonsPresenterProtocol? { get set }
    func getPokemons()
}

class PokemonsInteractor : PokemonsInteractorProtocol {
    var presenter: PokemonsPresenterProtocol?
    var pokemonsWorker: PokemonsWorkerType

    init(pokemonsWorker: PokemonsWorkerType) {
        self.pokemonsWorker = pokemonsWorker
    }

    func getPokemons() {
        pokemonsWorker.getPokemons { [weak self] result in
            switch result {
            case .success(let pokemons):
                self?.presenter?.setPokemonList(pokemonList: pokemons)
                self?.presenter?.setupPokemonTableView()
            case .failure(_):
                self?.presenter?.showErrorDialog()
            }
        }
    }
}
