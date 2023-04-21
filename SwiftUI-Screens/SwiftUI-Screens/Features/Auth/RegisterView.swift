//
//  RegisterView.swift
//  SwiftUI-Screens
//
//  Created by Glenn Ludszuweit on 21/04/2023.
//

import SwiftUI

struct RegisterView: View {
    @State var username: String = ""
    @State var email: String = ""
    @State var password: String = ""
    @State var repassword: String = ""
    var body: some View {
        VStack {
            Group {
                TextField("Username", text: $username)
                TextField("Email address", text: $email)
                TextField("Password", text: $password)
                TextField("Repeat password", text: $repassword)
            }.padding(10)
                .textFieldStyle(.roundedBorder)
            
            Text("By submiting this form, you agree to the terms and services.")
                .frame(maxWidth: .infinity)
                .foregroundColor(.gray)
                .padding(5)
            
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

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
