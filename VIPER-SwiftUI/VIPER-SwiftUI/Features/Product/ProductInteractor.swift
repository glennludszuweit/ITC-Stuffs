//
//  ProductInteractor.swift
//  VIPER-SwiftUI
//
//  Created by Glenn Ludszuweit on 15/05/2023.
//

import Foundation

class ProductInteractor {
    func fetchProducts() async throws -> [Product] {
        guard let url = URL(string: "https://dummyjson.com/product") else { fatalError("Invalid URL") }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let result = try JSONDecoder().decode(ProductData.self, from: data)
            return result.products
        } catch let error {
            fatalError(error.localizedDescription)
        }
    }
}
