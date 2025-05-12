//
//  RegisterRequestBody.swift
//  practice
//
//  Created by 조휘원 on 5/3/25.
//

struct RegisterRequestBody : Codable {
    let loginId: String
    let password: String
    let nickname: String
}
