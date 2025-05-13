//
//  RegisterService.swift
//  practice
//
//  Created by 조휘원 on 5/3/25.
//

import Foundation

final class RegisterService {
    static let shared = RegisterService()
    private init() {}

    private func makeRequestBody(
        loginId: String,
        password: String,
        nickname: String
    ) -> Data? {
        let body = RegisterRequestBody(
            loginId: loginId,
            password: password,
            nickname: nickname
        )
        return try? JSONEncoder().encode(body)
    }

    func postRegisterData(
        loginId: String,
        password: String,
        nickname: String
    ) async throws -> RegisterResponseBody {
        guard let body = makeRequestBody(
            loginId: loginId,
            password: password,
            nickname: nickname
        ) else {
            throw NetworkError.requestEncodingError
        }

        guard let request = RequestBuilder.makeRequest(
            path: "/auth/signup",
            method: .POST,
            body: body
        ) else {
            throw NetworkError.requestEncodingError
        }

        let response: APIResponse<RegisterResponseBody> = try await NetworkManager.shared.request(
            request,
            decodeType: APIResponse<RegisterResponseBody>.self
        )
        return response.data!
    }
}
