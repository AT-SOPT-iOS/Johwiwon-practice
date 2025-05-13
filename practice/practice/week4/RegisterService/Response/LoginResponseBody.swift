//
//  LoginResponseBody.swift
//  practice
//
//  Created by 조휘원 on 5/13/25.
//

struct LoginResponseWrapper: Codable {
    let success: Bool
    let code: String
    let message: String
    let data: LoginDataResponseBody
}

struct LoginDataResponseBody: Codable {
    let userId: Double
}
