//
//  UserModel.swift
//  SwiftUI-Screens
//
//  Created by Glenn Ludszuweit on 23/04/2023.
//

import Foundation
import SwiftUI

class UserModel: ObservableObject {
    @Published var isLoggedIn: Bool = false
    @Published var name: String = "Glenn Ludszuweit"
    @Published var job: String = "iOS Developer"
    @Published var username: String = "ghludszuweit"
    @AppStorage("email") var email: String = "glenn@email.com"
    
    func updateEmail(newEmail: String) {
        self.email = newEmail
    }
    
    func logInUser(setUser: Bool) {
        self.isLoggedIn = setUser
    }
}
