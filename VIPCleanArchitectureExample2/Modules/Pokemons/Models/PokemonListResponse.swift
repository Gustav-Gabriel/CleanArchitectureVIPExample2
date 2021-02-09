//
//  PokemonsResponse.swift
//  CleanArquitectureVIPExample
//
//  Created by Gustavo Gelabert Gabriel on 01/02/21.
//

import Foundation
import SwiftyJSON

struct PokemonListResponse {
    enum PokemonListResponseKeys : String {
        case results
    }
    var results: [PokemonResponse]?
}

extension PokemonListResponse : JSONProtocol {
    static func decodeJSON(json: JSON) -> PokemonListResponse? {
        var pokemonListResponse = PokemonListResponse()
        if let resultsArray =  json[PokemonListResponseKeys.results.rawValue].array {
            for item in resultsArray {
                if let pokemon = PokemonResponse.decodeJSON(json: item) {
                    if pokemonListResponse.results == nil {
                        pokemonListResponse.results = [pokemon]
                    } else {
                        pokemonListResponse.results?.append(pokemon)
                    }
                }
            }
        }
        return pokemonListResponse
    }

    static func encodeJSON(model: PokemonListResponse) -> JSON {
        return JSON()
    }
}
