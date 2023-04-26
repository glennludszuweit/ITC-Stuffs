//
//  LoginView.swift
//  SwiftUI-Screens
//
//  Created by Glenn Ludszuweit on 21/04/2023.
//

import SwiftUI

struct LoginView: View {
    let authViewModel = AuthViewModel()
    @State var path = [Root]()
    @State var email: String = ""
    @State var password: String = ""
    @EnvironmentObject var userModel: UserModel
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                Image("pizza")
                    .resizable()
                    .frame(width: 250, height: 250)
                
                Group {
                    TextField(NSLocalizedString("placeholder_username_email", comment: "Username Email"), text: $email)
                    SecureField(NSLocalizedString("placeholder_password", comment: "Password"), text: $password)
                }.padding(10)
                    .textFieldStyle(.roundedBorder)
                
                HStack {
                    NavigationLink(destination: {
                        ResetPassView()
                    },label: {
                        Text(NSLocalizedString("button_forgot_pass", comment: "Forgot Pass"))
                            .foregroundColor(.orange)
                    }).padding()
                        .padding(.top, -10)
                        .padding(.bottom, -10)
                    Spacer()
                }
                
                Button(action: {
                    if authViewModel.validateAdminUser(email: email, pass: password) {
                        userModel.isLoggedIn = true
                        path.append(.main)
                    } else {
                        print("Invalid user!")
                    }
                }, label: {
                    Text(NSLocalizedString("button_submit", comment: "Login"))
                        .frame(maxWidth: .infinity)
                }).padding(10)
                    .buttonStyle(.borderedProminent)
                    .tint(.orange)
                
                
                Spacer()
                
                HStack {
                    Text("Don't have an account yet?")
                    NavigationLink(destination: {
                        RegisterView()
                    },label: {
                        Text(NSLocalizedString("button_register", comment: "Register"))
                            .foregroundColor(.orange)
                    })
                }
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
