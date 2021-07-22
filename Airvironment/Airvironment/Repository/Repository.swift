//
//  Repository.swift
//  Airvironment
//
//  Created by Letnja Praksa 2 on 22.7.21..
//

import UIKit

protocol Repository{
    
    func getAll(result: @escaping ((Result<Array<Air>, Error>) -> Void))
        
    
    
    func getLatest(result: @escaping  ((Result <Air, Error>) -> Void))
        
    
}
