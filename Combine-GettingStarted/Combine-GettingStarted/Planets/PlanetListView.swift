//
//  PlanetListView.swift
//  Combine-GettingStarted
//
//  Created by Glenn Ludszuweit on 05/05/2023.
//

import SwiftUI

struct PlanetListView: View {
    @StateObject var planetViewModel = PlanetViewModel(networkManager: NetworkManager(), errorManager: ErrorManager())
    @State private var searchText = ""
    
    var filteredPlanets: [PlanetEntity] {
        if searchText.isEmpty {
            return planetViewModel.planetList
        } else {
            return planetViewModel.planetList.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }
    }
    
    var body: some View {
        NavigationStack {
            List(filteredPlanets) { planet in
                NavigationLink {
                    PlanetDetailsView(planet: planet)
                } label: {
                    HStack {
                        Text(planet.name)
                        Spacer()
                    }
                }
                
            }.padding()
        }
        .onAppear {
            planetViewModel.getAllPlanets(apiUrl: APIServices.planetsApi)
        }
        .refreshable {
            planetViewModel.getAllPlanets(apiUrl: APIServices.planetsApi)
        }
        .searchable(text: $searchText)
    }
}

struct PlanetListView_Previews: PreviewProvider {
    static var previews: some View {
        PlanetListView()
    }
}
