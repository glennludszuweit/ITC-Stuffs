//
//  UserUpdateView.swift
//  SwiftUI-Screens
//
//  Created by Glenn Ludszuweit on 23/04/2023.
//

import SwiftUI

struct UserUpdateView: View {
    @Binding var isUpdating: Bool
    @ObservedObject var user = UserModel()
    
    var body: some View {
        VStack {
            Group {
                TextField(user.email, text: $user.email)
            }.padding()
                .textFieldStyle(.roundedBorder)
                .keyboardType(.emailAddress)
            
            
            Button {
                isUpdating.toggle()
                user.updateEmail(newEmail: user.email)
            } label: {
                Text(NSLocalizedString("button_save", comment: "Save Button"))
            }.buttonStyle(.borderedProminent)
                .padding()
                .tint(.orange)
        }.padding()
    }
}

struct UserUpdateView_Previews: PreviewProvider {
    static var previews: some View {
        UserUpdateView(isUpdating: .constant(true))
    }
}
