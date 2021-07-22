//
//  Picture.swift
//  test_app
//
//  Created by Letnja Praksa 2 on 20.7.21..
//

import UIKit

class Air: NSObject, Codable {
    var humidity: Float?
    var pollution: Float?
    var id: Int?
    var created:String?
    var temperature: Float?

    init(humidity: Float, pollution:Float, id:Int, created:String, temperature: Float) {
        self.humidity = humidity
        self.pollution = pollution
        self.id = id
        self.created = created
        self.temperature = temperature
}

enum CodingKeys: String, CodingKey {
    case humidity
    case pollution
    case id
    case created
    case temperature 
}
}
