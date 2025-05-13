//
//  NickNameResponseBody.swift
//  practice
//
//  Created by 조휘원 on 5/13/25.
//

// 내 닉네임 조회
struct NickNameReponseWrapper: Codable {
    let success: Bool
    let code: String
    let message: String
    let data: NickNameResponseBody
}

struct NickNameResponseBody: Codable {
    let nickname: String
}

// 닉네임 수정
