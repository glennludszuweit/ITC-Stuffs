//
//  Fruit.swift
//  Tabs-UIKit
//
//  Created by Glenn Ludszuweit on 14/04/2023.
//

import Foundation

struct Fruit: Codable {
    let id: Int
    let name: String
    let genus: String
    let family, order: String
    let nutritions: Nutritions
}

struct Nutritions: Codable {
    let carbohydrates: Double
    let protein: Double
    let fat: Double
    let calories: Int
    let sugar: Double
}
