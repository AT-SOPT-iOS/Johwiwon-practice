//
//  RegisterResponseBody.swift
//  practice
//
//  Created by 조휘원 on 5/3/25.
//

struct RegisterReponseWrapper: Codable {
    let success: Bool
    let code: String
    let message: String
    let data: RegisterResponseBody
}

struct RegisterResponseBody: Codable {
    let userId: Double
    let nickname: String
}

struct NickNameListReponseWrapper: Codable {
    let success: Bool
    let code: String
    let message: String
    let data: NickNameListResponseModel
}

struct NickNameListResponseModel: Codable {
    let nicknameList: [String]
}
