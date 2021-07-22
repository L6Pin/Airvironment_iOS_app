//
//  AlamoFileDataSource.swift
//  test_app
//
//  Created by Letnja Praksa 2 on 20.7.21..
//

import UIKit
import Alamofire

class AlamoFireDataSource: RemoteDataSource {

    
    func getLatest(result: @escaping ((Result<Air, Error>) -> Void)) {
        AF.request(Router.Air.getLatest, interceptor: nil).response{serverResponse in
            switch serverResponse.result {
            case.success(_):
                do {
                    let jsonDecoder = JSONDecoder()
                    let responseBody: Air = try jsonDecoder.decode(Air.self, from: serverResponse.data!) as Air
                    result(.success(responseBody))
                } catch let error {
                    result(.failure(error))
                }
            case.failure(let error):
                result(.failure(error))
            }
        }
    }
    

    
    func getAll(result: @escaping ((Result<Array<Air>, Error>) -> Void)) {
        AF.request(Router.Air.getAll, interceptor: nil).response{serverResponse in
            switch serverResponse.result {
            case.success(_):
                do {
                    let jsonDecoder = JSONDecoder()
                    let responseBody: Array<Air> = try jsonDecoder.decode(Array<Air>.self, from: serverResponse.data!) as Array<Air>
                    result(.success(responseBody))
                } catch let error {
                    result(.failure(error))
                }
            case.failure(let error):
                result(.failure(error))
            }
        }
    }
}
