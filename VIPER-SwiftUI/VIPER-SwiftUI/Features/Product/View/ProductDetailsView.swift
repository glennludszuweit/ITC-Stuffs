//
//  ProductDetailsView.swift
//  SwiftUI-Screens
//
//  Created by Glenn Ludszuweit on 21/04/2023.
//

import SwiftUI

struct ProductDetailsView: View {
    @StateObject var presenter: ProductDetailsPresenter
    
    var body: some View {
        VStack {
            Text(presenter.product.title)
            Text(presenter.product.description)
        }
        .navigationTitle(presenter.product.title)
    }
}

struct ProductDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailsView(presenter: ProductDetailsPresenter(product: Product(id: 1, title: "", description: "")))
    }
}
