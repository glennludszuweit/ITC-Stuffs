//
//  User.swift
//  Chaining-Requests
//
//  Created by Glenn Ludszuweit on 05/06/2023.
//

import Foundation

// MARK: - User
struct User: Codable {
    let id: Int?
    let name, username, email: String?
}

// MARK: - Post
struct Post: Codable {
    let userID, id: Int?
    let title, body: String?
}

// MARK: - Comment
struct Comment: Codable, Identifiable {
    let postID, id: Int?
    let name, email, body: String?
}
