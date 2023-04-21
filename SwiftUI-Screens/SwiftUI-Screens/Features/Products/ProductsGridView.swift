//
//  ProductsGridView.swift
//  SwiftUI-Screens
//
//  Created by Glenn Ludszuweit on 21/04/2023.
//

import SwiftUI

struct ProductsGridView: View {
    let numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                ForEach(numbers, id: \.self) { item in
                    NavigationLink(destination: ProductDetailsView(text: "\(item)")) {
                        Text("\(item)")
                            .frame(width: 100, height: 100)
                            .background(.orange)
                            .cornerRadius(10)
                            .foregroundColor(.white)
                    }
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 20)
        }
    }
}

struct ProductsGridView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsGridView()
    }
}
