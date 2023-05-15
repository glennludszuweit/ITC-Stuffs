//
//  NetworkManager.swift
//  UIImage-UIKit
//
//  Created by Glenn Ludszuweit on 19/04/2023.
//

import Foundation

class NetworkManager: NetworkProtocol {
    func getAll(apiURL: URL) async throws -> Data {
        do {
            let (data, _) = try await URLSession.shared.data(from: apiURL)
            return data
        } catch let error {
            throw error
        }
    }
}
