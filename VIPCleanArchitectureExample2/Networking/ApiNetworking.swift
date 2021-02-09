//
//  Networking.swift
//  CleanArquitectureVIPExample
//
//  Created by Gustavo Gelabert Gabriel on 01/02/21.
//

import Foundation
import Alamofire
import SwiftyJSON

enum ApiNetworkingResult<T> {
    case success(T)
    case failure(ApiNetworkingError)
}

struct ApiNetworkingError {
    var httpCode: Int
    var message: String
    var status: String

    init(httpCode: Int, message: String, status: String) {
        self.httpCode = httpCode
        self.message = message
        self.status = status
    }
}

protocol ApiNetworkingType {
    func call(withRouter apiRoute: URLRequestConvertible,
              callback:@escaping ((ApiNetworkingResult<JSON>) -> Void))
}
class ApiNetworking {
    static let shared: ApiNetworkingType = ApiNetworking()
}

extension ApiNetworking: ApiNetworkingType {
    func call(
        withRouter apiRoute: URLRequestConvertible,
        callback: @escaping ((ApiNetworkingResult<JSON>) -> Void)) {

        guard let urlRequest = apiRoute.urlRequest else { return }
        AF.request(urlRequest)
        .validate(statusCode: 200..<300)
        .responseJSON { response in
            print(response)
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                callback(.success(json))
            case .failure(let error):
                print(error)
                guard
                    let responseData = response.data,
                    let code = JSON(responseData)["httpCode"].int,
                    let message = JSON(responseData)["message"].string,
                    let status = JSON(responseData)["status"].string
                    else {
                        return callback(.failure(ApiNetworkingError(httpCode: 0, message: "", status: "")))
                    }
                    callback(
                        .failure(
                            ApiNetworkingError(
                                httpCode: code,
                                message: message,
                                status: status
                            )
                        )
                    )

            }
        }

    }
}
