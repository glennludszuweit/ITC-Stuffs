//
//  FakeNetworkManager.swift
//  DepInv-Gen-TestTests
//
//  Created by Glenn Ludszuweit on 16/04/2023.
//

import Foundation
@testable import DepInv_Gen_Test

class FakeNetworkManager: NetworkProtocol {
    func getAll<T: Decodable>(apiURL: String, handler: @escaping (Result<T, Error>) -> Void) {
        let bundle = Bundle(for: FakeNetworkManager.self)
        guard let url = URL(string: apiURL) else { return }
        guard let path = bundle.url(forResource: url.absoluteString, withExtension: ".json") else { return }
        
        do {
            let data = try Data(contentsOf: path)
            let list = try JSONDecoder().decode(T.self, from: data )
            handler(.success(list))
        } catch {
            handler(.failure(error))
            print(error.localizedDescription)
        }
    }
}

class MockNetworkManager: NetworkProtocol {
    func getAll<T>(apiURL: String, handler: @escaping (Result<T, Error>) -> Void) where T : Decodable {
        let mockData = [
            Fruit(id: 1, name: "Apple", genus: "Round", family: "Apple", order: "Uber eats", nutritions: Nutritions(carbohydrates: 5.0, protein: 5.0, fat: 5.0, calories: 25, sugar: 20.0 )),
            Fruit(id: 2, name: "Pears", genus: "Oval", family: "Pear", order: "Lieferando", nutritions: Nutritions(carbohydrates: 7.0, protein: 1.0, fat: 4.0, calories: 20, sugar: 21.0 )),
            Fruit(id: 3, name: "Peach", genus: "Circle", family: "Stone", order: "Deliveroo", nutritions: Nutritions(carbohydrates: 3.0, protein: 3.0, fat: 8.0, calories: 15, sugar: 11.0 )),
        ]
        handler(.success(mockData as! T))
    }
}

class StubNetworkManager: NetworkProtocol {
    var stubbedData: [Fruit] = []
    
    func getAll<T>(apiURL: String, handler: @escaping (Result<T, Error>) -> Void) where T : Decodable {
        handler(.success(stubbedData as! T))
    }
}
