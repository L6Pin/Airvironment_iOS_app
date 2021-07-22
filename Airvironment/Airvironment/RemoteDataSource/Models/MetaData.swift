//
//  MetaData.swift
//  Airvironment
//
//  Created by Letnja Praksa 2 on 22.7.21..
//

import UIKit

class MetaData: NSObject, Codable {
    var page: Int?
    var perPage: Int?
    var total: Int?
    
    init(page: Int, perPage: Int, total: Int) {
        self.page = page
        self.perPage = perPage
        self.total = total
    }
    
    enum CodingKeys: String, CodingKey {
        case page
        case perPage = "per_page"
        case total
    }
}
