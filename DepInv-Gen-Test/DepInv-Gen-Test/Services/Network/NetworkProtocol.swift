//
//  NetworkProtocol.swift
//  DepInv-Gen-Test
//
//  Created by Glenn Ludszuweit on 16/04/2023.
//

import Foundation

protocol NetworkProtocol {
    func getAll<T: Decodable>(apiURL: String, handler: @escaping (Result<T, Error>) -> Void)
}
