//
//  UserViewModel.swift
//  Tabs-UIKit
//
//  Created by Glenn Ludszuweit on 14/04/2023.
//

import Foundation

class UserViewModel {
    let networkManager: NetworkProtocol
    var users = [User]()
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    func getUsers(completion: @escaping () -> Void) {
        networkManager.getAll(apiURL: "https://jsonplaceholder.typicode.com/users") { (result: Result<[User], Error>) in
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
