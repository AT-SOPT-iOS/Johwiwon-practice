//
//  NetworkError.swift
//  practice
//
//  Created by 조휘원 on 5/3/25.
//

enum NetworkError: Error, CustomStringConvertible {
    case requestEncodingError
    case responseDecodingError
    case responseError
    case unknownError
    case loginFailed
    case internalServerError
    case notFoundError
    case custom(message: String)

    var description: String { errorDescription }

    var errorDescription: String {
        switch self {
        case .custom(let message): return message
        case .loginFailed: return "로그인에 실패하였습니다."
        case .requestEncodingError: return "요청 인코딩에 실패했습니다."
        case .responseError: return "서버 응답 오류가 발생했습니다."
        case .responseDecodingError: return "응답 디코딩에 실패했습니다."
        case .unknownError: return "알 수 없는 오류가 발생했습니다."
        case .internalServerError: return "서버 내부 오류(500)."
        case .notFoundError: return "리소스를 찾을 수 없습니다(404)."
        }
    }
}
