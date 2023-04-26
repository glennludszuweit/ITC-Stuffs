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
                TextField(NSLocalizedString("placeholder_username", comment: "Username"), text: $username)
                TextField(NSLocalizedString("placeholder_email", comment: "Email"), text: $email)
                TextField(NSLocalizedString("placeholder_password", comment: "Password"), text: $password)
                TextField(NSLocalizedString("placeholder_repassword", comment: "RePassword"), text: $repassword)
            }.padding(10)
                .textFieldStyle(.roundedBorder)
            
            Text(NSLocalizedString("text_terms", comment: "Terms"))
                .frame(maxWidth: .infinity)
                .foregroundColor(.gray)
                .padding(5)
            
            Button(action: {
                print(NSLocalizedString("button_submit", comment: "Submit"))
            }, label: {
                Text(NSLocalizedString("button_submit", comment: "Submit"))
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
