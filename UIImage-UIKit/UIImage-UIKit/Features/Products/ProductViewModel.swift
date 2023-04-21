//
//  ProductViewModel.swift
//  UIImage-UIKit
//
//  Created by Glenn Ludszuweit on 19/04/2023.
//

import Foundation

class ProductViewModel {
    let networkManager: NetworkProtocol
    var products = [Product]()
    
    init(networkManager: NetworkProtocol) {
        self.networkManager = networkManager
    }
    
    func getProducts(urlString: String = "https://dummyjson.com/products", completion: @escaping () -> Void) {
        networkManager.getAll(apiURL: urlString) { (result: Result<ProductData, Error>) in
            switch result {
            case .success(let data):
                self.products = data.products
                completion()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
