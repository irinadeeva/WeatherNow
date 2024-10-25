import Foundation

public enum NetworkError: Error, LocalizedError, Equatable {

    case missingRequiredFields(String)

    case invalidParameters(operation: String, parameters: [Any])

    case badRequest

    case unauthorized

    case paymentRequired

    case forbidden

    case notFound

    case requestEntityTooLarge

    case unprocessableEntity

    case http(httpResponse: HTTPURLResponse, data: Data)

    case invalidResponse(Data)

    case deleteOperationFailed(String)

    case network(URLError)

    case unknown(Error?)


    public var localizedDescription: String {
        switch self {
        case let .missingRequiredFields(fields):
            return "Missing required fields: \(fields)."
        case let .invalidParameters(operation, parameters):
            return """
            The provided parameters are not valid for the requested operation:
            - operation: \(operation)
            - parameters: \(parameters)
            """

        case .badRequest:
            return "400: Invalid request encoding (this shouldn't happen; open an issue for further investigation)."
        case .unauthorized:
            return "401: Use a valid API key and try to access the resource again."
        case .paymentRequired:
            return "402: Your quota for this type of request exceeded; try upgrading your plan."
        case .forbidden:
            return "403: You don't have access to the requested resource or action."
        case .notFound:
            return "404: The requested resource could not be found."
        case .requestEntityTooLarge:
            return "413: Payload bigger than what the API supports."
        case .unprocessableEntity:
            return "422: The payload sent fails some base validations; modify the payload to conform the the validations performed and try again."
        case let .http(httpResponse: response, data: data):
            return """
            Request failed with HTTP status code \(response.statusCode) \(HTTPURLResponse.localizedString(forStatusCode: response.statusCode))
            - response headers:
                \(response.allHeaderFields)
            - response data:
                \(String(data: data, encoding: .utf8) ?? "<invalid encoding>")
            """

        case let .invalidResponse(data):
            return "Response is not a valid JSON: \(String(data: data, encoding: .utf8) ?? "<invalid encoding>")"

        case let .deleteOperationFailed(id):
            return "Delete operation status returned `false` for record with id: \(id)."

        case let .network(urlError):
            return "Networking error: \(urlError.localizedDescription)."
        case let .unknown(underlyingError):
            if let error = underlyingError {
                return "Unknown error: \(error.localizedDescription)."
            } else {
                return "Unknown error."
            }
        }
    }

    public static func == (lhs: NetworkError, rhs: NetworkError) -> Bool {
        lhs.localizedDescription == rhs.localizedDescription
    }
}
