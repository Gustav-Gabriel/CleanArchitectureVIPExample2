//
//  PokemonsResponse.swift
//  CleanArquitectureVIPExample
//
//  Created by Gustavo Gelabert Gabriel on 22/01/21.
//

import Foundation
import SwiftyJSON

struct PokemonResponse {
    enum PokemonsResponseKeys: String {
        case name
    }
    var name: String?
}

extension PokemonResponse : JSONProtocol {
    static func encodeJSON(model: PokemonResponse) -> JSON {
        return JSON()
    }

    static func decodeJSON(json: JSON) -> PokemonResponse? {
        var pokemonsResponse = PokemonResponse()
        pokemonsResponse.name = json[PokemonsResponseKeys.name.rawValue].stringValue
        return pokemonsResponse
    }
}
