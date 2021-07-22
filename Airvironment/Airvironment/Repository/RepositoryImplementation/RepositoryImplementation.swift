//
//  AnimalRepository.swift
//  test_app
//
//  Created by Letnja Praksa 2 on 20.7.21..
//

import UIKit

class RepositoryImplementation: Repository {
    
    let remoteData:RemoteDataSource = RemoteDataSourceImplementation()
    var webRemoteDataSource: RemoteDataSource = AlamoFireDataSource()

    
    func getAll(result: @escaping ((Result<Array<Air>, Error>) -> Void)){
        webRemoteDataSource.getAll(result: result)
    }
    
    func getLatest (result: @escaping  ((Result <Air, Error>) -> Void)){
        webRemoteDataSource.getLatest(result: result)
    }
}

