//
//  UsersViewModel.swift
//  Users-UIKit-MVVM
//
//  Created by Glenn Ludszuweit on 13/04/2023.
//

import Foundation

class UserViewModel {
    let userService = UserService()
    var users = [User]()
    var reloadUsersData: (() -> Void)?
    
    func getUsers() {
        userService.getUsers { (result: Result<[User], Error>) in
            switch result {
            case .success(let users):
                self.users = users
                self.reloadUsersData?()
                self .users = users
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
