//
//  ErrorResponse.swift
//  practice
//
//  Created by 조휘원 on 5/13/25.
//

struct ErrorResponse: Codable {
    let success: Bool
    let code: String
    let message: String
}
