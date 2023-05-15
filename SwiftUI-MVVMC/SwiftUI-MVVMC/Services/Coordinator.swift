//
//  Coordinator.swift
//  SwiftUI-MVVMC
//
//  Created by Glenn Ludszuweit on 15/05/2023.
//

import Foundation
import SwiftUI

class Coordinator: ObservableObject {
    @Published var navigationPath = NavigationPath()
    var planet: PlanetEntity = PlanetEntity(id: UUID(), name: "", diameter: "", climate: "", gravity: "", population: "")
    
    func planetsListScreen() {
        navigationPath.append(CurrentPage.planetsList)
    }
    
    func planetDetailsScreen(planet: PlanetEntity) {
        self.planet = planet
        navigationPath.append(CurrentPage.planetDetails)
    }
}

enum CurrentPage {
    case planetsList
    case planetDetails
}
