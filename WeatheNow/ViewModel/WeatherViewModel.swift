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
    @Published var errorMessage: String? = nil
    @Published var showAlert = false

    private let weatherService = WeatherService()

    func fetchWeather(at location: Coordinates) {
        weatherService.fetchWeather(location: location) {  [weak self] result in
            guard let self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let weatherData):
                    self.cityName = weatherData.name
                    self.temperature = String(format: "%.0f", weatherData.main.temp) + "°C"
                    self.weatherDescription = weatherData.weather.first?.description ?? ""

                case .failure(let error):
                    self.errorMessage = "Loading error: \(error.errorDescription)"
                    self.showAlert = true
                }
            }
        }
    }
}
