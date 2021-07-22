//
//  RemoteDataSource.swift
//  test_app
//
//  Created by Letnja Praksa 2 on 20.7.21..
//

import UIKit

protocol RemoteDataSource{
    
    
    func getAll(result: @escaping ((Result<Array<Air>, Error>) -> Void))
    
    func getLatest(result: @escaping  ((Result <Air, Error>) -> Void))
}


