//
//  PokemonListView.swift
//  WorkingWithAPI-SwiftUI
//
//  Created by Glenn Ludszuweit on 24/04/2023.
//

import SwiftUI

struct PokemonGalleryView: View {
    @StateObject var pokemonViewModel: PokemonViewModel
    @State private var showDetails = false
    @State var largeImage: String = ""
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                ForEach(pokemonViewModel.pokemons, id: \.self) { item in
                    
                    AsyncImage(url: URL(string: item.images.small!)) {
                        Image in
                        Image.resizable()
                            .scaledToFit()
                            .onTapGesture {
                                showDetails = true
                                largeImage = item.images.large!
                            }
                            .sheet(isPresented: $showDetails) {
                                PokemonDetailsView(largeImageUrl: largeImage)
                            }
                    } placeholder: {
                        ProgressView()
                    }
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 20)
        }
        .task {
            await pokemonViewModel.getAll()
        }
    }
}


struct PokemonListView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonGalleryView(pokemonViewModel: PokemonViewModel(manager: NetworkManager()))
    }
}
