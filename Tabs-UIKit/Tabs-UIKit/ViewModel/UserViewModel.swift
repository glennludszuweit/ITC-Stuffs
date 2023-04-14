//
//  UserViewModel.swift
//  Tabs-UIKit
//
//  Created by Glenn Ludszuweit on 14/04/2023.
//

import Foundation

class UserViewModel {
    let userService: UserService
    var users = [User]()
    
    init(userService: UserService) {
        self.userService = userService
    }
    
    func getUsers(completion: @escaping () -> Void) {
        userService.getUsers(userURL: "https://jsonplaceholder.typicode.com/users") { (result: Result<[User], Error>) in
            switch result {
            case .success(let users):
                self.users = users
                completion()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
