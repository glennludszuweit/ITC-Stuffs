//
//  ContentView.swift
//  SwiftUI-GettingStarted
//
//  Created by Glenn Ludszuweit on 19/04/2023.
//

import SwiftUI

struct ContentView: View {
    @State var emailOrUserName: String = ""
    @State var password: String = ""
    
    var body: some View {
        VStack {
            Image("pizza")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 250, height: 250)
            
            TextField("Enter email or username", text: $emailOrUserName)
                .padding(.horizontal, 25.0)
                .padding(.top, 15.0)
                .textFieldStyle(.roundedBorder)
            
            TextField("Enter password", text: $password)
                .padding(.horizontal, 25.0)
                .padding(.top, 15.0)
                .textFieldStyle(.roundedBorder)
            
            Button("Submit") {
                print(emailOrUserName)
            }
                .buttonStyle(.borderedProminent)
                .padding(.horizontal, 25.0)
                .padding(.top, 15.0)
            
            Spacer()
        }
        .padding(.top, 15.0)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
