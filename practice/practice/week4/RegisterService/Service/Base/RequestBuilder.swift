//
//  RequestBuilder.swift
//  practice
//
//  Created by 조휘원 on 5/13/25.
//

import Foundation

enum HTTPMethod: String {
    case GET, POST, PATCH
}

struct RequestBuilder {
    static func makeRequest(
        baseURL: String = "http://api.atsopt-seminar4.site/api/v1",
        path: String,
        method: HTTPMethod = .GET,
        queryItems: [URLQueryItem]? = nil,
        headers: [String: String]? = ["Content-Type": "application/json"],
        body: Data? = nil
    ) -> URLRequest? {
        var urlComponents = URLComponents(string: baseURL + path)
        urlComponents?.queryItems = queryItems

        guard let url = urlComponents?.url else { return nil }

        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        headers?.forEach {
            request.setValue($0.value, forHTTPHeaderField: $0.key)
        }
        request.httpBody = body
        return request
    }
}

