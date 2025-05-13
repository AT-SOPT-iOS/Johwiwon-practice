//
//  UserManager.swift
//  practice
//
//  Created by 조휘원 on 5/13/25.
//

final class UserManager {
    static let shared = UserManager()
    private init() {}
    
    var userId: Double?
}
