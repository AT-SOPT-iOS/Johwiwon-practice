//
//  LoginService.swift
//  practice
//
//  Created by 조휘원 on 5/13/25.
//

import Foundation

final class LoginService {
    static let shared = LoginService()
    private init() {}

    private func makeRequestBody(
        loginId: String,
        password: String
    ) -> Data? {
        let body = LoginRequestBody(loginId: loginId, password: password)
        return try? JSONEncoder().encode(body)
    }

    func postLoginData(
        loginId: String,
        password: String
    ) async throws -> LoginDataResponseBody {
        guard let body = makeRequestBody(loginId: loginId, password: password) else {
            throw NetworkError.requestEncodingError
        }

        guard let request = RequestBuilder.makeRequest(
            path: "/auth/signin",
            method: .POST,
            body: body
        ) else {
            throw NetworkError.requestEncodingError
        }

        let response: LoginResponseWrapper = try await NetworkManager.shared.request(
            request,
            decodeType: LoginResponseWrapper.self
        )

        return response.data

    }
}

