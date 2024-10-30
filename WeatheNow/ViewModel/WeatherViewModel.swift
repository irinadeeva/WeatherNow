//
//  WeatherViewModel.swift
//  WeatheNow
//
//  Created by Irina Deeva on 24/10/24.
//

import Foundation

class WeatherViewModel: ObservableObject {
    @Published var weather: WeatherData?
    @Published var errorMessage: String? = nil
    @Published var showAlert = false
    @Published var isLoading = false

    private let weatherService = WeatherService()

    func fetchWeather(at location: Coordinates) {
        isLoading = true

        weatherService.fetchWeather(location: location) {  [weak self] result in
            guard let self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let weatherData):
                    self.weather = weatherData
                    self.isLoading = false

                case .failure(let error):
                    self.errorMessage = "Loading error: \(error.errorDescription)"
                    self.showAlert = true
                    self.isLoading = false
                }
            }
        }
    }
}
