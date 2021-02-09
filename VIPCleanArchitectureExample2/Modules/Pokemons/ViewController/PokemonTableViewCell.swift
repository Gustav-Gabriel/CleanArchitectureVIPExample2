//
//  PokemonTableViewCell.swift
//  CleanArquitectureVIPExample
//
//  Created by Gustavo Gelabert Gabriel on 01/02/21.
//

import Foundation
import UIKit

class PokemonTableViewCell : UITableViewCell {
    @IBOutlet weak var lblName: UILabel!

    func setName(name: String) {
        lblName.text = name
    }
}
