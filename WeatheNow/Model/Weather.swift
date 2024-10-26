//
//  Weather.swift
//  WeatheNow
//
//  Created by Irina Deeva on 24/10/24.
//

import Foundation

struct WeatherData: Decodable {
    let name: String
    let main: Main
    let weather: [Weather]
    
    struct Main: Decodable {
        let temp: Double
    }
    
    struct Weather: Decodable {
        let description: String
    }
}
