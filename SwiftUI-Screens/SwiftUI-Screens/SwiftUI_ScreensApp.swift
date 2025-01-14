//
//  SwiftUI_ScreensApp.swift
//  SwiftUI-Screens
//
//  Created by Glenn Ludszuweit on 21/04/2023.
//

import SwiftUI

@main
struct SwiftUI_ScreensApp: App {
    let userModel = UserModel()
    
    var body: some Scene {
        WindowGroup {
            LoginView()
                .environmentObject(userModel)
        }
    }
}
