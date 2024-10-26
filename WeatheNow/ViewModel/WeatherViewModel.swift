//
//  WeatherViewModel.swift
//  WeatheNow
//
//  Created by Irina Deeva on 24/10/24.
//

import Foundation

class WeatherViewModel: ObservableObject {
    @Published var cityName: String = "Loading..."
    @Published var temperature: String = "--"
    @Published var weatherDescription: String = "--"

    private let weatherService = WeatherService()

    func fetchWeather(at location: Coordinates) {
        //TODO: fetch weather
        weatherService.fetchWeather(location: location) { weatherData in
            guard let weatherData = weatherData else { return }
//            DispatchQueue.main.async {
                self.cityName = weatherData.name
                self.temperature = String(format: "%.0f", weatherData.main.temp) + "°C"
                self.weatherDescription = weatherData.weather.first?.description ?? ""
//            }
        }
    }
    
}
