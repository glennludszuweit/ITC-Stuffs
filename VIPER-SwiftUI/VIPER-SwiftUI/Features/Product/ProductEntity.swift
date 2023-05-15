//
//  ProductEntity.swift
//  VIPER-SwiftUI
//
//  Created by Glenn Ludszuweit on 15/05/2023.
//

import Foundation

struct ProductData: Codable {
    let products: [Product]
}

struct Product: Codable, Identifiable {
    let id: Int
    let title: String
    let description: String
}
