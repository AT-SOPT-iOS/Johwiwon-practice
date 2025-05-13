//
//  PatchNickNameService.swift
//  practice
//
//  Created by 조휘원 on 5/13/25.
//

import Foundation

final class PatchNickNameService {
    static let shared = PatchNickNameService()
    private init() {}

    func patchNickname(userId: Double, newNickname: String) async throws {
        let body = try JSONEncoder().encode(NickNameRequestBody(nickname: newNickname))

        guard let request = RequestBuilder.makeRequest(
            path: "/users",
            method: .PATCH,
            headers: ["userId": "\(Int(userId))"],
            body: body
        ) else {
            throw NetworkError.requestEncodingError
        }
        
        print("PATCH 요청 URL:", request.url?.absoluteString ?? "없음")
        print("PATCH 헤더:", request.allHTTPHeaderFields ?? [:])
        print("PATCH Body:", String(data: body, encoding: .utf8) ?? "없음")


        let response = try await NetworkManager.shared.request(
            request,
            decodeType: APIResponse<EmptyResponse>.self
        )
        
        print("▶ PATCH 응답:", response)

        guard response.success else {
            throw NetworkError.custom(message: response.message)
        }
    }
}

