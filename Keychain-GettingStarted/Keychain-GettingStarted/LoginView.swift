//
//  LoginView.swift
//  SwiftUI-Screens
//
//  Created by Glenn Ludszuweit on 21/04/2023.
//

import SwiftUI
import Security

struct User: Codable {
    var email: String
    var password: String
}

struct LoginView: View {
    let authViewModel = AuthViewModel()
    @State var email: String = ""
    @State var password: String = ""
    @State var user = User(email: "", password: "")
    
    var body: some View {
        NavigationStack {
            VStack {
                Group {
                    TextField("Email", text: $email)
                    SecureField("Password", text: $password)
                }.padding(10)
                    .textFieldStyle(.roundedBorder)
                
                Group {
                    Button(action: {
                        if authViewModel.validateAdminUser(email: email, pass: password) {
                            user.email = email
                            user.password = password
                            try? authViewModel.saveDataToKeychain(value: user, key: "user-info")
                        } else {
                            print("Invalid user!")
                        }
                    }, label: {
                        Text("Save to Keychain")
                            .frame(maxWidth: .infinity)
                    }).tint(.orange)
                    
                    Button(action: {
                        authViewModel.getDataFromKeychain(key: "user-info")
                    }, label: {
                        Text("Retrieve from Keychain")
                            .frame(maxWidth: .infinity)
                    }).tint(.cyan)
                    
                    Button(action: {
                        authViewModel.removeDataFromKeychain(key: "user-info")
                    }, label: {
                        Text("Remove from Keychain")
                            .frame(maxWidth: .infinity)
                    }).tint(.red)
                }.padding(10)
                    .buttonStyle(.borderedProminent)
            }
            .padding()
            .padding(.top, 50)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
