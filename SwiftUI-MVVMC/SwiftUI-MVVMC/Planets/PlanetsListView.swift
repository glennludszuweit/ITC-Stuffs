//
//  PlanetsListView.swift
//  Combine-GettingStarted
//
//  Created by Glenn Ludszuweit on 05/05/2023.
//

import SwiftUI

struct PlanetsListView: View {
    @StateObject var planetViewModel = PlanetViewModel(networkManager: NetworkManager(), errorManager: ErrorManager())
    @EnvironmentObject var coordinator: Coordinator
    @State private var searchText = ""
    
    var body: some View {
        List(planetViewModel.filteredPlanets) { planet in
            Button {
                coordinator.planetDetailsScreen(planet: planet)
            } label: {
                HStack {
                    Text(planet.name)
                    Spacer()
                }
            }
            
        }.padding()
            .onAppear {
                planetViewModel.getAllPlanets(apiUrl: APIServices.planetsApi)
                print(planetViewModel.errorMessage)
            }
            .refreshable {
                planetViewModel.getAllPlanets(apiUrl: APIServices.planetsApi)
            }
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
            .onChange(of: searchText) { text in
                planetViewModel.searchPlanets(searchText: text)
            }
    }
}

struct PlanetListView_Previews: PreviewProvider {
    static var previews: some View {
        PlanetsListView()
    }
}
