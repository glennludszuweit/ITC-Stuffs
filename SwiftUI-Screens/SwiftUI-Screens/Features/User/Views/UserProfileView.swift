//
//  UserProfileView.swift
//  SwiftUI-Screens
//
//  Created by Glenn Ludszuweit on 23/04/2023.
//

import SwiftUI

struct UserProfileView: View {
    @Binding var isUpdating: Bool
    @StateObject var user = UserModel()
   
    var body: some View {
        
        VStack {
            Group {
                Text(user.name).fontWeight(.bold)
                Text(user.job)
                Text(user.username)
                Text(user.email)
            }.padding()
            
            Button {
                isUpdating.toggle()
            } label: {
                Text(NSLocalizedString("button_edit", comment: "Edit Button"))
            }.buttonStyle(.borderedProminent)
                .padding()
                .tint(.orange)
        }.padding()
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView(isUpdating: .constant(false))
    }
}
