//
//  GetInfoService.swift
//  practice
//
//  Created by 조휘원 on 5/3/25.
//

import Foundation

final class GetInfoService {
    static let shared = GetInfoService()
    private init() {}

    func fetchNicknameList(keyword: String?) async throws -> [String] {
        var queryItems: [URLQueryItem] = []
        if let keyword, !keyword.isEmpty {
            queryItems.append(URLQueryItem(name: "keyword", value: keyword))
        }

        guard let request = RequestBuilder.makeRequest(
            path: "/users",
            method: .GET,
            queryItems: queryItems
        ) else {
            throw NetworkError.requestEncodingError
        }

        let response: NickNameListReponseWrapper = try await NetworkManager.shared.request(
            request,
            decodeType: NickNameListReponseWrapper.self
        )

        return response.data.nicknameList

    }
}
