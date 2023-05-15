//
//  TestNetworkManager.swift
//  SwiftUI-MVVMCTests
//
//  Created by Glenn Ludszuweit on 15/05/2023.
//

import Foundation
import Combine

@testable import SwiftUI_MVVMC

class MockNetworkManager: NetworkProtocol {
    var stubbedGetAllResult: AnyPublisher<PlanetData, Error>?

    func getAll<T>(apiUrl: URL, type: T.Type) -> AnyPublisher<T, Error> where T: Decodable {
        guard let result = stubbedGetAllResult as? AnyPublisher<T, Error> else {
            fatalError("Missing stubbed result for getAll")
        }
        return result
    }
}


class MockErrorManager: ErrorProtocol {
    func handleError(_ error: Error) -> String {
        return "Mock Error Message"
    }
}
