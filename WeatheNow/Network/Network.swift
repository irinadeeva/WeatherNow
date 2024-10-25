import Foundation

final class Network: NSObject {

    static let shared = Network()

    private let session: URLSession = URLSession(configuration: .default)

    private var urlComponent = URLComponents(string: RequestConstants.baseURL)

    private lazy var decoder = JSONDecoder()

    private lazy var encoder = JSONEncoder()

    override private init() { }

    func get<T: Decodable>(path: String,
                                 completion: @escaping (T?, NetworkError?) -> Void) {
        let request = buildRequest(method: "GET", path: path)

        let task = perform(request: request!) { [weak self] data, response, error in
            guard let data, error == nil else {
                completion(nil, ResponseHandler.shared.mapError(error!))
                return
            }

            let object = try? self?.decoder.decode(T.self, from: data)
            completion(object, nil)
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
        urlComponent?.path = "/api/v1"+path

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
