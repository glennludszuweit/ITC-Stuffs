//
//  Network.swift
//  Chaining-Requests
//
//  Created by Glenn Ludszuweit on 05/06/2023.
//

import Foundation
import Combine

enum ApiError: Error {
    case emptyUsers
    case emptyPosts
    case emptyComments
}

struct API {
    static let users = "https://jsonplaceholder.typicode.com/users"
    static let posts = "https://jsonplaceholder.typicode.com/posts"
    static let comments = "https://jsonplaceholder.typicode.com/comments"
}

struct CombineImpl {
    func getUsers() -> AnyPublisher<[User], Error> {
        let url = URL(string: API.users)!
        return URLSession.shared.dataTaskPublisher(for: url)
            .map({ $0.data })
            .decode(type: [User].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    func getPosts(userId: Int) -> AnyPublisher<[Post], Error> {
        let url = URL(string: "\(API.posts)?userId=\(userId)")!
        return URLSession.shared.dataTaskPublisher(for: url)
            .map({ $0.data })
            .decode(type: [Post].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    func getComments(postId: Int) -> AnyPublisher<[Comment], Error> {
        let url = URL(string: "\(API.comments)?postId=\(postId)")!
        return URLSession.shared.dataTaskPublisher(for: url)
            .map({ $0.data })
            .decode(type: [Comment].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
