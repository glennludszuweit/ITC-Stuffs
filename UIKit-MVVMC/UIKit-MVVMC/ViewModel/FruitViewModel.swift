//
//  FruitViewModel.swift
//  Tabs-UIKit
//
//  Created by Glenn Ludszuweit on 14/04/2023.
//

import Foundation

import Foundation

class FruitViewModel {
    let networkManager: NetworkProtocol
    var fruit = [Fruit]()
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    func getUsers(completion: @escaping () -> Void) {
        networkManager.getAll(apiURL: "https://fruityvice.com/api/fruit/all") { (result: Result<[Fruit], Error>) in
            switch result {
            case .success(let fruit):
                self.fruit = fruit
                completion()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
