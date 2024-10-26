import Foundation

final class Network: NSObject {

    static let shared = Network()

    private let session: URLSession = URLSession(configuration: .default)

    private var urlComponent = URLComponents(string: RequestConstants.baseURL)

    private lazy var decoder = JSONDecoder()

    private lazy var encoder = JSONEncoder()

    override private init() { }

    func fetch(path: String, completion: @escaping (Result<WeatherData, Error>) -> Void) {
        let request = buildRequest(method: "GET", path: path)

        let task = perform(request: request!) { data, response, error in

            if let error = error {
                completion(.failure(ResponseHandler.shared.mapError(error)))
                return
            }

            guard let data else {
                completion(.failure(ResponseHandler.shared.mapError(NetworkError.notFound)))
                return
            }

            do {
                let response = try self.decoder.decode(WeatherData.self, from: data)
                completion(.success(response))
            } catch {
                completion(.failure(ResponseHandler.shared.mapError(error)))
            }
        }
        
        task.resume()
    }
}

extension Network: URLSessionDelegate {

    func perform(request: URLRequest,
                completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void)
    -> URLSessionDataTask {
        return session.dataTask(with: request,
                                completionHandler: completionHandler)
    }


    func buildRequest(method: String,
                      path: String,
                      apiKey: String? = nil,
                      queryItems: [URLQueryItem]? = nil,
                      body: (any Codable)? = nil)
    -> URLRequest? {
        urlComponent?.path = path

        if let queryItems = queryItems {
            urlComponent?.queryItems = queryItems
        }

        guard let theURL = urlComponent?.url else { return nil }

        var request = URLRequest(url: theURL)
        request.httpMethod = method

        if let apiKey {
            request.addValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        }

        if let body {
            do {
                request.httpBody = try encoder.encode(body)
                request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            } catch {
                return nil
            }
        }

        return request
    }
}
