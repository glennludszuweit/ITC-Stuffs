//
//  AuthManager.swift
//  Design-Patterns
//
//  Created by Glenn Ludszuweit on 04/05/2023.
//

import Foundation

class AuthManager {
    static let shared = AuthManager()
    
    private init() {}
    
    var isLoggedIn: Bool = false
    var authToken: String = ""
    
    func login(token: String) {
        isLoggedIn = true
        authToken = token
    }
    
    func logout() {
        isLoggedIn = false
        authToken = ""
    }
}
