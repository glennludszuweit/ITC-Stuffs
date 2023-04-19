//
//  Product.swift
//  UIImage-UIKit
//
//  Created by Glenn Ludszuweit on 19/04/2023.
//

import Foundation

struct Products: Codable {
    let products: [Product]
}

// MARK: - Product
struct Product: Codable {
    let id: Int
    let title, description: String
    let price: Int
    let discountPercentage, rating: Double
    let stock: Int
    let brand, category: String
    let thumbnail: String
    let images: [String]
}
