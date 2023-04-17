//
//  UserViewModel.swift
//  DepInv-Gen-Test
//
//  Created by Glenn Ludszuweit on 16/04/2023.
//

import Foundation

class UserViewModel {
    let networkManager: NetworkProtocol
    var users = [User]()
    
    init(networkManager: NetworkProtocol) {
        self.networkManager = networkManager
    }
    
    func getUsers(urlString: String = "https://jsonplaceholder.typicode.com/users", completion: @escaping () -> Void) {
        networkManager.getAll(apiURL: urlString) { (result: Result<[User], Error>) in
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
