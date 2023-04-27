//
//  CoreData_GettingStartedApp.swift
//  CoreData-GettingStarted
//
//  Created by Glenn Ludszuweit on 27/04/2023.
//

import SwiftUI

@main
struct CoreData_GettingStartedApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            PokemonGalleryView(pokemonViewModel: PokemonViewModel(networkManager: NetworkManager()))
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
