import Foundation

final class ResponseHandler {

    static let shared = ResponseHandler()

    func mapResponse(_ response: (data: Data, response: URLResponse)) throws -> Data {
        guard let httpResponse = response.response as? HTTPURLResponse else {
            return response.data
        }
        
        switch httpResponse.statusCode {
        case 200..<300:
            return response.data
        case 400:
            throw NetworkError.badRequest
        case 401:
            throw NetworkError.unauthorized
        case 402:
            throw NetworkError.paymentRequired
        case 403:
            throw NetworkError.forbidden
        case 404:
            throw NetworkError.notFound
        case 413:
            throw NetworkError.requestEntityTooLarge
        case 422:
            throw NetworkError.unprocessableEntity
        default:
            throw NetworkError.http(httpResponse: httpResponse, data: response.data)
        }
    }

    func mapError(_ error: Error) -> NetworkError {
        if let ErrorManager = error as? NetworkError {
            return ErrorManager
        }
        
        if let urlError = error as? URLError {
            return .network(urlError)
        }
        
        return .unknown(error)
    }
}
