//
//  NetworkManager.swift
//  practice
//
//  Created by 조휘원 on 5/13/25.
//

import Foundation

final class NetworkManager {
    static let shared = NetworkManager()
    private init() {}

    func request<T: Decodable>(
        _ urlRequest: URLRequest,
        decodeType: T.Type
    ) async throws -> T {
        let (data, response) = try await URLSession.shared.data(for: urlRequest)

        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.responseError
        }

        if !(200...299).contains(httpResponse.statusCode) {
            if let errorResponse = try? JSONDecoder().decode(ErrorResponse.self, from: data) {
                throw NetworkError.custom(message: errorResponse.message)
            }

            switch httpResponse.statusCode {
            case 400: throw NetworkError.loginFailed
            case 404: throw NetworkError.notFoundError
            case 500: throw NetworkError.internalServerError
            default: throw NetworkError.unknownError
            }
        }

        if decodeType == EmptyResponse.self,
           data.isEmpty || String(data: data, encoding: .utf8)?.trimmingCharacters(in: .whitespacesAndNewlines) == "null" {
            return EmptyResponse() as! T
        }

        return try JSONDecoder().decode(T.self, from: data)
    }
}

