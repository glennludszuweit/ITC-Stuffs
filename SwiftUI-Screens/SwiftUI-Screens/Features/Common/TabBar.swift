//
//  ProductsTabBar.swift
//  SwiftUI-Screens
//
//  Created by Glenn Ludszuweit on 21/04/2023.
//

import SwiftUI

struct TabBar: View {
    @EnvironmentObject var userModel: UserModel
    
    var body: some View {
        if userModel.isLoggedIn {
            Text("You're Verified!")
        }
        TabView {
            ProductsTableView()
                .tabItem {
                    Image(systemName: "tablecells.fill")
                    Text("ListView")
                }
            
            ProductsGridView()
                .tabItem {
                    Image(systemName: "photo.fill.on.rectangle.fill")
                    Text("GridView")
                }
            
            WebView()
                .tabItem {
                    Image(systemName: "globe")
                    Text("WebView")
                }
            
            UserView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
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
