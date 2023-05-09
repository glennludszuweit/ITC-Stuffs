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
                    Image(systemName: "square.fill")
                    Text("Factory")
                }
            
            CarFacadeView()
                .tabItem {
                    Image(systemName: "square.fill")
                    Text("Facade")
                }
            
            CarObserverView()
                .tabItem {
                    Image(systemName: "square.fill")
                    Text("Observer")
                }
            
            CarProtocolDelegateView()
                .tabItem {
                    Image(systemName: "square.fill")
                    Text("Protocol")
                }
            
            CarClosureView()
                .tabItem {
                    Image(systemName: "square.fill")
                    Text("Closure")
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
