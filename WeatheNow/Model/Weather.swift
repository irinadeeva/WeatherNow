//
//  Weather.swift
//  WeatheNow
//
//  Created by Irina Deeva on 24/10/24.
//

import Foundation

struct WeatherData: Decodable {
    let weather: [WeatherResponse]
    let main: MainResponse
    let visibility: Int
    let name: String
    let wind: WindResponse
    let clouds: CloudsResponse

    struct WeatherResponse: Decodable {
        let main: String
        let icon: String
    }

    struct MainResponse: Decodable {
        let temp: Double
        let feels_like: Double
        let temp_min: Double
        let temp_max: Double
        let pressure: Double
        let humidity: Int
    }

    struct WindResponse: Decodable {
        let speed: Double
    }

    struct CloudsResponse: Decodable {
        let all: Int
    }
}

extension WeatherData.MainResponse {
    var feelsLike: Double { return feels_like }
    var tempMin: Double { return temp_min }
    var tempMax: Double { return temp_max }
}

extension WeatherData.WeatherResponse {
    var iconUrl: String { return RequestConstants.imageURL + icon + "@2x.png"}
}
