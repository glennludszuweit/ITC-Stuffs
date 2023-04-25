//
//  WorkingWithAPI_SwiftUIApp.swift
//  WorkingWithAPI-SwiftUI
//
//  Created by Glenn Ludszuweit on 24/04/2023.
//

import SwiftUI

@main
struct WorkingWithAPI_SwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            PokemonGalleryView(pokemonViewModel: PokemonViewModel(manager: NetworkManager()))
        }
    }
}
