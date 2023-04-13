//
//  NetworkService.swift
//  Users-UIKit-MVVM
//
//  Created by Glenn Ludszuweit on 13/04/2023.
//

import Foundation

class UserService {
    let decoder = JSONDecoder()
    let userURL = "https://jsonplaceholder.typicode.com/users"
    
    func getUsers(handler: @escaping (Result<[User], Error>) -> Void) {
        guard let url = URL(string: userURL) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else { return }
            guard error == nil else { return }
            guard let data = data else { return }
            
            do {
                let result = try self.decoder.decode([User].self, from: data)
                handler(.success(result))
            } catch {
                handler(.failure(error.localizedDescription as! Error))
            }
        }
        .resume()
    }
}
