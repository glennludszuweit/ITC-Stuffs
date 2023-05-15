//
//  ProductInteractor.swift
//  VIPER-SwiftUI
//
//  Created by Glenn Ludszuweit on 15/05/2023.
//

import Foundation

class ProductInteractor {
    func fetchProducts() async throws -> [Product] {
        let url = URL(string: "https://dummyjson.com/product")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        let result = try decoder.decode(ProductData.self, from: data)
        return result.products
    }
}
