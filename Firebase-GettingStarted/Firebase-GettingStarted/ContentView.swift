//
//  ContentView.swift
//  Firebase-GettingStarted
//
//  Created by Glenn Ludszuweit on 03/05/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Group {
                Button("Crashlytics") {
                    fatalError("Crash was triggered")
                }.tint(.red)
                
                Button("Analytics") {
                    FirebaseHelper.analyticsGenerator(itemId: "id/test-button", itemName: "Test Analytics Button", contentType: "Test")
                }.tint(.purple)
            }.padding()
                .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
