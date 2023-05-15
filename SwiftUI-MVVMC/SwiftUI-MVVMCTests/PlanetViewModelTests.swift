//
//  PlanetViewModelTests.swift
//  SwiftUI-MVVMCTests
//
//  Created by Glenn Ludszuweit on 15/05/2023.
//

import Foundation
import Quick
import Nimble
import Combine

@testable import SwiftUI_MVVMC

class PlanetViewModelSpec: QuickSpec {
    override class func spec() {
        describe("PlanetViewModel") {
            var viewModel: PlanetViewModel!
            var mockNetworkManager: MockNetworkManager!
            var mockErrorManager: MockErrorManager!

            beforeEach {
                mockNetworkManager = MockNetworkManager()
                mockErrorManager = MockErrorManager()
                viewModel = PlanetViewModel(networkManager: mockNetworkManager, errorManager: mockErrorManager)
            }

            describe("getAllPlanets") {
                context("when a valid API URL is provided") {
                    it("should fetch and populate the planetList") {
                        let apiUrl = "https://example.com/api/planets"
                        let expectedPlanets = [
                            Planet(name: "Mercury", diameter: "4879", climate: "Hot", gravity: "3.7", population: "0"),
                            Planet(name: "Venus", diameter: "12104", climate: "Hot", gravity: "8.87", population: "0")
                        ]
                        
                        let stubbedResult = Result<PlanetData, Error>.success(PlanetData(results: expectedPlanets))
                        mockNetworkManager.stubbedGetAllResult = Result.Publisher(stubbedResult).eraseToAnyPublisher()

                        viewModel.getAllPlanets(apiUrl: apiUrl)

                        expect(viewModel.filteredPlanets.count).toEventually(equal(expectedPlanets.count))

                        for (index, expectedPlanet) in expectedPlanets.enumerated() {
                            let planetEntity = viewModel.filteredPlanets[index]
                            expect(planetEntity.name).to(equal(expectedPlanet.name))
                            expect(planetEntity.diameter).to(equal(expectedPlanet.diameter))
                            expect(planetEntity.climate).to(equal(expectedPlanet.climate))
                            expect(planetEntity.gravity).to(equal(expectedPlanet.gravity))
                            expect(planetEntity.population).to(equal(expectedPlanet.population))
                        }
                    }
                }
            }
        }
    }
}
