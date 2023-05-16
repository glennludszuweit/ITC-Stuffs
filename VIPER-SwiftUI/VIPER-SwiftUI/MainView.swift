//
//  ProductsTabBar.swift
//  SwiftUI-Screens
//
//  Created by Glenn Ludszuweit on 21/04/2023.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationView {
            TabView {
                ProductRouter.navigateToProductsList()
                    .tabItem {
                        Image(systemName: "tablecells.fill")
                        Text(NSLocalizedString("bar_label_listview", comment: "ListView"))
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
        }
    }
    
}

struct ProductsTabBar_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
