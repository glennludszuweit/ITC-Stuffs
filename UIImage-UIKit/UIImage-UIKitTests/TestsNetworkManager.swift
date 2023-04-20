//
//  FakeNetworkManager.swift
//  UIImage-UIKitTests
//
//  Created by Glenn Ludszuweit on 20/04/2023.
//

import Foundation
@testable import UIImage_UIKit

class FakeNetworkManager: NetworkProtocol {
    func getAll<T: Decodable>(apiURL: String, handler: @escaping (Result<T, Error>) -> Void) {
        let bundle = Bundle(for: FakeNetworkManager.self)
        guard let url = URL(string: apiURL) else { return }
        guard let path = bundle.url(forResource: url.absoluteString, withExtension: "json") else { return }
        
        do {
            let data = try Data(contentsOf: path)
            let list = try JSONDecoder().decode(T.self, from: data)
            print(list)
            handler(.success(list))
        } catch {
            handler(.failure(error))
            print(error.localizedDescription)
        }
    }
}
