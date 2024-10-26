//
//  WeatherService.swift
//  WeatheNow
//
//  Created by Irina Deeva on 24/10/24.
//

import Foundation

typealias WeatherCompletion = (Result<WeatherData, NetworkError>) -> Void

final class WeatherService {
    private let urlSession = URLSession.shared
    
    func fetchWeather(location: Coordinates, completion: @escaping WeatherCompletion) {
        guard let request = weatherRequest(location: location) else {
            completion(.failure(NetworkError.invalidRequest))
            return
        }
        
        let task = urlSession.objectTask(for: request){ (result: Result<WeatherData, NetworkError>) in
            switch result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
    
}

extension WeatherService {
    func weatherRequest(location: Coordinates) -> URLRequest? {
        return URLRequest.buildRequest(
            path: RequestConstants.baseURL,
            queryItems: [URLQueryItem(name: "lat", value: "\(location.latitude)"),
                         URLQueryItem(name: "lon", value: "\(location.longitude)"),
                         URLQueryItem(name: "appid", value: RequestConstants.apiKey),
                         URLQueryItem(name: "units", value: "metric")])
    }
}
