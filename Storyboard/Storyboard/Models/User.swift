//
//  User.swift
//  Storyboard
//
//  Created by Glenn Ludszuweit on 06/04/2023.
//

import Foundation

struct MockUser: Decodable {
    let id: String
    let createdAt: String
    let avatar: String
    let firstName: String
    let lastName: String
    let email: String
    let jobtitle: String
    let favouriteColor: String
}

struct MockAPIUser: Decodable {
    let id: Int
    let name, username, email: String
    let address: Address
    let phone, website: String
    let company: Company
}

struct Address: Codable {
    let street, suite, city, zipcode: String
    let geo: Geo
}

struct Geo: Codable {
    let lat, lng: String
}

struct Company: Codable {
    let name, catchPhrase, bs: String
}
