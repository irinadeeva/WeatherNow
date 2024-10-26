//
//  WeatherService.swift
//  WeatheNow
//
//  Created by Irina Deeva on 24/10/24.
//

import Foundation

public enum NetworkError: Error {
    case codeError
    case noData
    case invalidResponse
}

typealias WeatherCompletion = (Result<WeatherData, NetworkError>) -> Void

final class WeatherService {

    func fetchWeather(location: Coordinates, completion: @escaping WeatherCompletion) {
        let urlString = "\(RequestConstants.baseURL)?lat=\(location.latitude)&lon=\(location.longitude)&appid=\(RequestConstants.apiKey)&units=metric"

        guard let url = URL(string: urlString) else {
            completion(.failure(NetworkError.codeError))
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(.failure(NetworkError.noData))
                return
            }

            do {
                let weatherData = try JSONDecoder().decode(WeatherData.self, from: data)
                completion(.success(weatherData))
            } catch {
                completion(.failure(NetworkError.invalidResponse))
            }

        }.resume()
    }
}
