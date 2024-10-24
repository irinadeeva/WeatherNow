//
//  Weather.swift
//  WeatheNow
//
//  Created by Irina Deeva on 24/10/24.
//

import Foundation

struct Weather: Decodable {
    let temperature: Double
    let weatherDescription: String

    enum CodingKeys: String, CodingKey {
        case temperature = "t"
        case weatherDescription = "w"
    }
}
