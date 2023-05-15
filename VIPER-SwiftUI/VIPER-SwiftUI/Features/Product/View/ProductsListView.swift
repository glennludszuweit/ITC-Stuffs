//
//  ProductsListView.swift
//  SwiftUI-Screens
//
//  Created by Glenn Ludszuweit on 21/04/2023.
//

import SwiftUI

struct ProductsListView: View {
    @StateObject var presenter: ProductsListPresenter
    
    var body: some View {
        List(presenter.products) { product in ProductRouter.navigateToProductDetailView(product: product)
        }
        .task {
            await presenter.fetchProducts()
        }
    }
}

struct ProductsTableView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsListView(presenter: ProductsListPresenter())
    }
}
