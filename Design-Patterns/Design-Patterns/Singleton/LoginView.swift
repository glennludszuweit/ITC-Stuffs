//
//  LoginView.swift
//  Design-Patterns
//
//  Created by Glenn Ludszuweit on 04/05/2023.
//

import SwiftUI

struct LoginView: View {
    let authViewModel = AuthViewModel()
    @State var path = [Root]()
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                Group {
                    TextField("Email", text: $email)
                    SecureField("Password", text: $password)
                }.padding(10)
                    .textFieldStyle(.roundedBorder)
                
                Button(action: {
                    if authViewModel.validateAdminUser(email: email, pass: password) {
                        AuthManager.shared.login(token: "\(email)-\(password)")
                        print(AuthManager.shared.authToken)
                        path.append(.main)
                    } else {
                        print("Invalid user!")
                    }
                }, label: {
                    Text("Login")
                        .frame(maxWidth: .infinity)
                }).padding(10)
                    .buttonStyle(.borderedProminent)
                    .tint(.orange)
                
            }
            .padding()
            .padding(.top, 50)
            .navigationDestination(for: Root.self) { navigate in
                switch navigate {
                case .main:
                    TabBar()
                }
            }
        }
    }
    
    enum Root {
        case main
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
