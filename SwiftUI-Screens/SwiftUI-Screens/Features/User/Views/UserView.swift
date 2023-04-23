//
//  UserView.swift
//  SwiftUI-Screens
//
//  Created by Glenn Ludszuweit on 23/04/2023.
//

import SwiftUI

struct UserView: View {
    @State var isUpdating: Bool = false
    
    var body: some View {
        VStack {
            if !isUpdating {
                UserProfileView(isUpdating: $isUpdating)
            } else {
                UserUpdateView(isUpdating: $isUpdating)
            }
        }
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
    }
}
