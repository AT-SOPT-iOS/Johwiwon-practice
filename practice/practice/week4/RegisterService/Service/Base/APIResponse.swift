//
//  APIResponse.swift
//  practice
//
//  Created by 조휘원 on 5/13/25.
//

struct APIResponse<T: Decodable>: Decodable {
    let success: Bool
    let code: String
    let message: String
    let data: T?
}

struct EmptyResponse: Codable {}
