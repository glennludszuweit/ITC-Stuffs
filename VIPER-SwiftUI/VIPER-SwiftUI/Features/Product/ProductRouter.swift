//
//  ProductRouter.swift
//  VIPER-SwiftUI
//
//  Created by Glenn Ludszuweit on 15/05/2023.
//

import Foundation
import SwiftUI

@MainActor
class ProductRouter {
    static func navigateToProductsList() -> some View {
        let presenter = ProductsListPresenter()
        return ProductsListView(presenter: presenter)
    }
    
    static func navigateToProductDetailView(product: Product) -> some View {
        let presenter = ProductDetailsPresenter(product: product)
        return NavigationLink {
            ProductDetailsView(presenter: presenter)
        } label: {
            Text(product.title)
        }
    }
}
