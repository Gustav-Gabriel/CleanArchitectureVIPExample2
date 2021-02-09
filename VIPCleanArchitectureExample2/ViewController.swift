//
//  ViewController.swift
//  VIPCleanArchitectureExample2
//
//  Created by Gustavo Gelabert Gabriel on 01/02/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let pokemonsViewController = segue.destination as? PokemonsViewController {
            PokemonsConfigurator.configureModule(viewController: pokemonsViewController)
        }
    }

}

