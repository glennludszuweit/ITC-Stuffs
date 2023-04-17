//
//  FruitViewModel.swift
//  DepInv-Gen-Test
//
//  Created by Glenn Ludszuweit on 16/04/2023.
//

import Foundation

class FruitViewModel {
    var networkManager: NetworkProtocol
    var fruit = [Fruit]()
    
    init(networkManager: NetworkProtocol) {
        self.networkManager = networkManager
    }
    
    func getFruits(urlString: String = "https://fruityvice.com/api/fruit/all",completion: @escaping () -> Void) {
        networkManager.getAll(apiURL: urlString) { (result: Result<[Fruit], Error>) in
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
