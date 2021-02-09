//
//  JSONProtocol.swift
//  CleanArquitectureVIPExample
//
//  Created by Gustavo Gelabert Gabriel on 01/02/21.
//

import Foundation

import Foundation
import SwiftyJSON

protocol JSONProtocol {
    static func decodeJSON(json: JSON) -> Self?
    static func encodeJSON(model: Self) -> JSON
}
