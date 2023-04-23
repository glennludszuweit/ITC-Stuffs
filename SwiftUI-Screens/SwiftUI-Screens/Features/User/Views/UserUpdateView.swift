//
//  UserUpdateView.swift
//  SwiftUI-Screens
//
//  Created by Glenn Ludszuweit on 23/04/2023.
//

import SwiftUI

struct UserUpdateView: View {
    @State var newEmail: String = ""
    @Binding var isUpdating: Bool
    @ObservedObject var user = UserModel()
    
    var body: some View {
        VStack {
            Group {
                TextField(user.email, text: $newEmail)
            }.padding()
                .textFieldStyle(.roundedBorder)
            
            Button {
                isUpdating.toggle()
                user.updateEmail(newEmail: newEmail)
            } label: {
                Text("Save Email")
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
