//
//  SwiftUI_MVVMCApp.swift
//  SwiftUI-MVVMC
//
//  Created by Glenn Ludszuweit on 12/05/2023.
//

import SwiftUI

@main
struct SwiftUI_MVVMCApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(Coordinator())
        }
    }
}
