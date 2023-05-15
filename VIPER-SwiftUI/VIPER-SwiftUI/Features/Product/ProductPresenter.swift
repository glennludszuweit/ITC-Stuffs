//
//  ProductPresenter.swift
//  VIPER-SwiftUI
//
//  Created by Glenn Ludszuweit on 15/05/2023.
//

import Foundation

@MainActor
class ProductsListPresenter: ObservableObject {
    @Published var products: [Product] = []
    
    func fetchProducts() async {
        let interactor = ProductInteractor()
        do {
            let products = try await interactor.fetchProducts()
            print(products)
            self.products = products
        } catch {
            print(error.localizedDescription)
        }
    }
}

class ProductDetailsPresenter: ObservableObject {
    let product: Product
    
    init(product: Product) {
        self.product = product
    }
}
