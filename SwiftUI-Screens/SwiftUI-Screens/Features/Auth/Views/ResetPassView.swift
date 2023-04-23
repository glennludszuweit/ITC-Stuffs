//
//  ResetPassView.swift
//  SwiftUI-Screens
//
//  Created by Glenn Ludszuweit on 21/04/2023.
//

import SwiftUI

struct ResetPassView: View {
    @State var email: String = ""
    var body: some View {
        VStack {
            TextField("Email address", text: $email)
                .padding(10)
                .textFieldStyle(.roundedBorder)
            
            Text("Enter registered email address.")
                .frame(maxWidth: .infinity)
                .foregroundColor(.gray)
            
            Button(action: {
                print("Submit")
            }, label: {
                Text("Submit")
                    .frame(maxWidth: .infinity)
            }).padding(10)
                .buttonStyle(.borderedProminent)
                .tint(.orange)
            
            Spacer()
        }
        .padding()
        .padding(.top, 100.0)
    }
}

struct ResetPassView_Previews: PreviewProvider {
    static var previews: some View {
        ResetPassView()
    }
}
