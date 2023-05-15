//
//  ProductRouter.swift
//  VIPER-SwiftUI
//
//  Created by Glenn Ludszuweit on 15/05/2023.
//

import Foundation
import SwiftUI

class ProductRouter {
    static func navigateToProductDetailView(product: Product) -> some View {
        let presenter = ProductDetailsPresenter(product: product)
        return NavigationLink {
            ProductDetailsView(presenter: presenter)
        } label: {
            Text(product.title)
        }
    }
}
