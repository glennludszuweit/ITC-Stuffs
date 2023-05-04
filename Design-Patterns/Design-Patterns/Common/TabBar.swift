//
//  TabBar.swift
//  Design-Patterns
//
//  Created by Glenn Ludszuweit on 04/05/2023.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            CarFactoryView()
                .tabItem {
                    Image(systemName: "tablecells.fill")
                    Text("Factory")
                }
            
//            ObserverView()
//                .tabItem {
//                    Image(systemName: "tablecells.fill")
//                    Text("Publisher")
//                }
        }
        .navigationBarBackButtonHidden(true)
    }
    
}

struct ProductsTabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
