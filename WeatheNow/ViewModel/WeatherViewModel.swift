//
//  WeatherViewModel.swift
//  WeatheNow
//
//  Created by Irina Deeva on 24/10/24.
//

import Foundation
import CoreLocation

class WeatherViewModel: ObservableObject {
    @Published var cityName: String = "Loading..."
    @Published var temperature: String = "--"
    @Published var weatherDescription: String = "--"

    func fetchWeather(at location: CLLocationCoordinate2D?) {
        //TODO: fetch weather
        print(location!)
    }
}
