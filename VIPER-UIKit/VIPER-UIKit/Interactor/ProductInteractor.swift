//
//  ProductInteractor.swift
//  VIPER-UIKit
//
//  Created by Glenn Ludszuweit on 12/05/2023.
//

import Foundation

class ProductInteractor: InteractorProtocol {
    var presenter: PresenterProtocol?
    let networkManager = NetworkManager()
    
    func getProductData(urlString: String) async {
        guard let url = URL(string: urlString) else {
            return
        }
        do {
            let result = try await self.networkManager.getAll(apiURL: url)
            let productData = try JSONDecoder().decode(ProductData.self, from: result)
            presenter?.getProductData(productData: productData)
        } catch let error {
           print(error)
        }
    }
}
