//
//  PokemonsWorker.swift
//  CleanArquitectureVIPExample
//
//  Created by Gustavo Gelabert Gabriel on 01/02/21.
//

import Foundation
import Alamofire

protocol PokemonsWorkerType {
    func getPokemons(completion: @escaping ((ApiNetworkingResult<PokemonListResponse>) -> Void))
}

class PokemonsWorker : PokemonsWorkerType {
    let apiNetworking = ApiNetworking.shared
    func getPokemons(completion: @escaping (((ApiNetworkingResult<PokemonListResponse>)) -> Void)) {
        let apiRoute = PokemonsWorkerSettings.getPokemons
        apiNetworking.call(withRouter: apiRoute) { result in
            switch result {
            case .success(let json):
                if let pokemons = PokemonListResponse.decodeJSON(json: json) {
                    completion(.success(pokemons))
                } else {
                    completion(.success(PokemonListResponse()))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

enum PokemonsWorkerSettings: URLRequestConvertible {
    case getPokemons

    var method: HTTPMethod {
        switch self {
        case .getPokemons:
            return .get
        }
    }
    var path: String {
        switch self {
        case .getPokemons:
            return "/v2/pokemon"
        }
    }
    var parameters: Parameters {
        switch self {
        case .getPokemons:
            return [:]
        }
    }

    var encoding: ParameterEncoding {
        switch self {
        case .getPokemons:
            return URLEncoding.default
        }
    }

    var headers: HTTPHeaders {
        switch self {
        case .getPokemons:
            return [:]
        }
    }

    func asURLRequest() throws -> URLRequest {
        let endPointUrl = try makeEndpointUrl(path: path)
        var request = URLRequest(url: endPointUrl)
        request.allHTTPHeaderFields = headers.dictionary
        request.timeoutInterval = 20
        request.httpMethod = method.rawValue
        return try encoding.encode(request, with: parameters)
    }
}
