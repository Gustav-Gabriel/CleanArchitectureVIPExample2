//
//  URLRequestConvertible+Extensions.swift
//  CleanArquitectureVIPExample
//
//  Created by Gustavo Gelabert Gabriel on 01/02/21.
//

import Foundation
import Alamofire

extension URLRequestConvertible {

    func makeEndpointUrl(path: String) throws -> URL {
        let apiUrl = "https://pokeapi.co/api"
        guard
            let endpointUrl = URL(string: apiUrl)?.appendingPathComponent(path) else {

                throw NSError(domain: "\(Self.self)",
                    code: -1000,
                    userInfo: [NSLocalizedDescriptionKey:
                        "Mount Endpoint URL",
                               NSLocalizedFailureReasonErrorKey:
                        "Incorrect Endpoint or Path"])
        }

        return endpointUrl
    }
}
