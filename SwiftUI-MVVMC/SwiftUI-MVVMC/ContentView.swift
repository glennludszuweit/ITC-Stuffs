//
//  ContentView.swift
//  SwiftUI-MVVMC
//
//  Created by Glenn Ludszuweit on 15/05/2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var coordinator: Coordinator
    
    var body: some View {
        NavigationStack(path: $coordinator.navigationPath) {
            PlanetsListView()
                .navigationDestination(for: CurrentPage.self) { navigation in
                    switch navigation {
                    case .planetsList:
                        PlanetsListView()
                    case .planetDetails:
                        PlanetDetailsView(planet: coordinator.planet)
                    }
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
