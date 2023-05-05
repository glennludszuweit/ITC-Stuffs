//
//  PlanetListView.swift
//  Combine-GettingStarted
//
//  Created by Glenn Ludszuweit on 05/05/2023.
//

import SwiftUI

struct PlanetListView: View {
    @StateObject var planetViewModel = PlanetViewModel(networkManager: NetworkManager(), errorManager: ErrorManager())
    
    var body: some View {
        NavigationStack {
            List(planetViewModel.planetList) { planet in
                NavigationLink {
                    PlanetDetailsView(planet: planet)
                } label: {
                    HStack {
                        Text(planet.name)
                        Spacer()
                    }
                }

            }.padding()
        }.onAppear {
            planetViewModel.getAllPlanets(apiUrl: APIServices.planetsApi)
            print(planetViewModel.errorMessage)
        }
    }
}

struct PlanetListView_Previews: PreviewProvider {
    static var previews: some View {
        PlanetListView()
    }
}
