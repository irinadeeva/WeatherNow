//
//  WeatherService.swift
//  WeatheNow
//
//  Created by Irina Deeva on 24/10/24.
//

import Foundation

typealias WeatherCompletion = (Result<WeatherData, NetworkError>) -> Void

final class WeatherService {

    func fetchWeather(location: Coordinates, completion: @escaping (WeatherData?) -> Void) {
        let urlString = "\(RequestConstants.baseURL)?lat=\(location.latitude)&lon=\(location.longitude)&appid=\(RequestConstants.apiKey)&units=metric"

            guard let url = URL(string: urlString) else {
                completion(nil)
                return
            }

            URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil else {
                    completion(nil)
                    return
                }

                let weatherData = try? JSONDecoder().decode(WeatherData.self, from: data)
                DispatchQueue.main.async {
                    print(weatherData)
                    completion(weatherData)
                }
            }.resume()
        }


//    func loadWeather(at coordinates: Coordinates, completion: @escaping WeatherCompletion) {
//        let path = "lat=\(coordinates.latitude)&lon=\(coordinates.longitude)&appid=\(RequestConstants.apiKey)&units=metric"
//
//        Network.shared.fetch(path: path) { weather, error  in
//            switch result {
//            case let .success(data):
//                completion(.success(data))
//            case let .failure(error):
//                completion(.failure(error))
//            }
//        }
//
//    }

//
//        private let urlSession = URLSession.shared
//
//        private init() {}
//
//        func fetchProfile(_ token: String, completionHandler: @escaping (Result<WeatherData, Error>) -> Void) {
//
//            guard let request = weatherRequest() else { return }
//
//            let task = urlSession.objectTask(for: request) { (result: Result<WeatherData, Error>) in
//                DispatchQueue.main.async {
//                    switch result {
//                    case .success(let data):
//                        completionHandler(.success(data))
//                    case .failure(let error):
//                        completionHandler(.failure(error))
//                    }
//                }
//            }
//
//            task.resume()
//        }


}

//extension WeatherService {
//    func weatherRequest() -> URLRequest? {
//        return URLRequest.buildRequest(
//            path: RequestConstants.baseURL)
//    }
//}
