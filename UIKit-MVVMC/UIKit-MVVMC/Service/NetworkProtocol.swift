//
//  NetworkProtocol.swift
//  Tabs-UIKit
//
//  Created by Glenn Ludszuweit on 14/04/2023.
//

import Foundation

protocol NetworkProtocol {
    func getAll<T: Decodable>(apiURL: String, handler: @escaping (Result<[T], Error>) -> Void)
}
