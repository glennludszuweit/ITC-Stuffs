//
//  ContentView.swift
//  Chaining-Requests
//
//  Created by Glenn Ludszuweit on 05/06/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        VStack {
            List(viewModel.comments) { comment in
                Text(comment.name ?? "")
            }
        }
        .onAppear {
            viewModel.getCommentsWithCombine()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
