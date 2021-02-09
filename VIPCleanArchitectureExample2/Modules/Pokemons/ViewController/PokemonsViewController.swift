//
//  PokemonsViewController.swift
//  CleanArquitectureVIPExample
//
//  Created by Gustavo Gelabert Gabriel on 22/01/21.
//

import Foundation
import UIKit

protocol PokemonsViewControllerProtocol {
    var router: PokemonsRouterProtocol? { get set }
    func setupTableView()
}

class PokemonsViewController : UIViewController, PokemonsViewControllerProtocol {
    @IBOutlet weak var tableView: UITableView!

    var interactor: PokemonsInteractorProtocol?
    var router: PokemonsRouterProtocol?
    var pokemonList: PokemonListResponse?

    override func viewDidLoad() {
        super.viewDidLoad()
        interactor?.getPokemons()
    }

    func setupTableView() {
        tableView.register(PokemonTableViewCell.self, forCellReuseIdentifier: "PokemonCell")
        tableView.delegate = self
        tableView.dataSource = self
    }

    func showError() {
        let alert = UIAlertController(title: "Eeepa Amigão!", message: "Parece, só parece que ocorreu um problema aqui...", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
