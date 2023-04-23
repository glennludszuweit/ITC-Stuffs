//
//  ProductsGridView.swift
//  SwiftUI-Screens
//
//  Created by Glenn Ludszuweit on 21/04/2023.
//

import SwiftUI

struct ProductsGridView: View {
    @Environment(\.colorScheme) private var colorScheme
    @ObservedObject var colorSchemeMode = ColorSchemeMode()
    
    var body: some View {
        ScrollView {
            Button(action: {
                colorSchemeMode.toggle()
            }) {
                if colorSchemeMode.isDarkMode {
                    Text("Switch to Light Mode")
                } else {
                    Text("Switch to Dark Mode")
                }
            }.padding()
                .buttonStyle(.borderedProminent)
                .tint(colorSchemeMode.isDarkMode ? .indigo : .orange)
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                ForEach(1...20, id: \.self) { item in
                    NavigationLink(destination: ProductDetailsView(text: "\(item)")) {
                        Text("\(item)")
                            .frame(width: 100, height: 100)
                            .background(colorSchemeMode.isDarkMode ? .indigo : .orange)
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
