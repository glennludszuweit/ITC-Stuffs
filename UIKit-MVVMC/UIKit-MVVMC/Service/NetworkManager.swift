//
//  UserService.swift
//  Tabs-UIKit
//
//  Created by Glenn Ludszuweit on 14/04/2023.
//

import Foundation

class NetworkManager: NetworkProtocol {
    
    
    let decoder = JSONDecoder()
    
    func getAll<T: Decodable>(apiURL: String, handler: @escaping (Result<[T], Error>) -> Void) {
        guard let url = URL(string: apiURL) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else { return }
            guard error == nil else { return }
            guard let data = data else { return }
            
            do {
                let result = try self.decoder.decode([T].self, from: data)
                handler(.success(result))
            } catch {
                handler(.failure(error.localizedDescription as! Error))
            }
        }
        .resume()
    }
}
