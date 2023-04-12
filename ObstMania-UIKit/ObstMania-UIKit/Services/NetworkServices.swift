//
//  FruitController.swift
//  ObstMania-UIKit
//
//  Created by Glenn Ludszuweit on 07/04/2023.
//

import Foundation

class NetworkServices {
    var delegate: DelegateData?
    var fruit: Fruit?
    let decoder = JSONDecoder()
    let apiUrl = "https://fruityvice.com/api/fruit/all"
    
    func getAllData<T: Decodable>(handler: @escaping (Result<[T], Error>) -> Void) {
        guard let url = URL(string: apiUrl) else { return }
        
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
    
    func getFruitByDelegate() {
        guard let url = URL(string: apiUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else { return }
            guard error == nil else { return }
            guard let data = data else { return }
            
            do {
                let result = try self.decoder.decode([Fruit].self, from: data)
                self.delegate?.didReceive(result)
            } catch {
                self.delegate?.didFail(with: error)
            }
        }
        .resume()
    }
}

protocol DelegateData {
    func didReceive(_ data: [Fruit])
    func didFail(with error: Error)
}

protocol DetailsViewDelegate {
    func delegateData(data: Fruit)
}


