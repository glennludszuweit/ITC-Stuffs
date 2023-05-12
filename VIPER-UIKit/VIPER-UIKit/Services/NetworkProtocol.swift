//
//  NetworkProtocol.swift
//  UIImage-UIKit
//
//  Created by Glenn Ludszuweit on 19/04/2023.
//

import Foundation

protocol NetworkProtocol {
    func getAll(apiURL: URL) async throws -> Data
}
