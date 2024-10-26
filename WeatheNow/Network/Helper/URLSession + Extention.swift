////
////  k.swift
////  WeatheNow
////
////  Created by Irina Deeva on 25/10/24.
////
//
//import Foundation
//
//extension URLSession {
//    func objectTask<T: Decodable>(for request: URLRequest,
//                                  completion: @escaping (Result<T, Error>) -> Void) -> URLSessionTask {
//        let task = dataTask(with: request) { data, response, error in
//            DispatchQueue.main.async {
//                if let error = error {
//                    completion(.failure(ResponseHandler.shared.mapError(error)))
//
//                }
//
//                if let response = response as? HTTPURLResponse,
//                   response.statusCode < 200 || response.statusCode >= 300 {
//                    completion(.failure(ResponseHandler.shared.mapResponse(response) as! Error))
//                }
//
//                guard let data = data else {
//                    completion(.failure(NetworkError.noData))
//                    return
//                }
//
//                do {
//                    let decodedData = try JSONDecoder().decode(T.self, from: data)
//                    completion(.success(decodedData))
//                } catch {
//                    completion(.failure(NetworkError.invalidResponse))
//                }
//            }
//        }
//
//        return task
//    }
//}
