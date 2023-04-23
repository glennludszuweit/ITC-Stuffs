//
//  ProductsModel.swift
//  SwiftUI-Screens
//
//  Created by Glenn Ludszuweit on 23/04/2023.
//

import Foundation
import SwiftUI

class ColorSchemeMode: ObservableObject {
    @Published var isDarkMode = false
    
    func toggle() {
        isDarkMode.toggle()
    }
}
