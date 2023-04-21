//
//  ProductsTabBar.swift
//  SwiftUI-Screens
//
//  Created by Glenn Ludszuweit on 21/04/2023.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            ProductsTableView()
                .tabItem {
                    Image(systemName: "1.circle")
                    Text("ListView")
                }
            
            ProductsGridView()
                .tabItem {
                    Image(systemName: "2.circle")
                    Text("GridView")
                }
            
            WebView()
                .tabItem {
                    Image(systemName: "3.circle")
                    Text("WebView")
                }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct ProductsTabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
