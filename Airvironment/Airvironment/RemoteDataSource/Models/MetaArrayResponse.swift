//
//  MetaArrayResponse.swift
//  Airvironment
//
//  Created by Letnja Praksa 2 on 22.7.21..
//

import UIKit

class MetaArrayResponse: NSObject, Codable {
    var meta: MetaData?
    var response: Array<Air>
    
    init(meta: MetaData? = nil, response: Array<Air>) {
        self.meta = meta
        self.response = response
    }
    
    enum CodingKeys: String, CodingKey {
        case meta
        case response = "per_page"
    }
}
