//
//  MyNickNameService.swift
//  practice
//
//  Created by 조휘원 on 5/13/25.
//

import Foundation

final class MyNickNameService {
    static let shared = MyNickNameService()
    private init() {}

    func fetchNickname(userId: Double) async throws -> String {
        guard
            let request = RequestBuilder.makeRequest(
                path: "/users/me",
                method: .GET,
                headers: ["userId": "\(Int(userId))"]
            )
        else {
            throw NetworkError.requestEncodingError
        }

        let response: APIResponse<NickNameResponseBody> =
            try await NetworkManager.shared
            .request(
                request,
                decodeType: APIResponse<NickNameResponseBody>.self
            )

        guard response.success, let data = response.data else {
            throw NetworkError.custom(message: response.message)
        }

        return data.nickname
    }
}
