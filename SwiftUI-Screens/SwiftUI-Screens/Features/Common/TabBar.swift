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
                    Text(NSLocalizedString("bar_label_listview", comment: "ListView"))
                }
            
            ProductsGridView()
                .tabItem {
                    Image(systemName: "photo.fill.on.rectangle.fill")
                    Text(NSLocalizedString("bar_label_gridview", comment: "GridView"))
                }
            
            WebView()
                .tabItem {
                    Image(systemName: "globe")
                    Text(NSLocalizedString("bar_label_webview", comment: "WebView"))
                }
            
            UserView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text(NSLocalizedString("bar_label_profile", comment: "Profile"))
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
