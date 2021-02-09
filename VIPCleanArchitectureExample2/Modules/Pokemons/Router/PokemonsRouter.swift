//
//  PokemonsRouter.swift
//  CleanArquitectureVIPExample
//
//  Created by Gustavo Gelabert Gabriel on 22/01/21.
//

import Foundation
import UIKit

protocol PokemonsRouterProtocol {
    var navigationController: UINavigationController? { get }
}
class PokemonsRounter : PokemonsRouterProtocol {
    weak var navigationController: UINavigationController?
    init() {}
}
