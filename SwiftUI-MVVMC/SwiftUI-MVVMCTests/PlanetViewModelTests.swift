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
            var planets: [Planet]!
            var planetsEntity: [PlanetEntity] = []
            
            beforeEach {
                mockNetworkManager = MockNetworkManager()
                mockErrorManager = MockErrorManager()
                viewModel = PlanetViewModel(networkManager: mockNetworkManager, errorManager: mockErrorManager)
                
                planets = [
                    Planet(name: "Mercury", diameter: "4879", climate: "Hot", gravity: "3.7", population: "0"),
                    Planet(name: "Venus", diameter: "12104", climate: "Hot", gravity: "8.87", population: "0"),
                    Planet(name: "Earth", diameter: "12742", climate: "Moderate", gravity: "9.81", population: "8000000000")
                ]
                
                planets.forEach { planet in
                    planetsEntity.append(PlanetEntity(id: UUID(), name: planet.name, diameter: planet.diameter, climate: planet.climate, gravity: planet.gravity, population: planet.population))
                    
                }
            }
            
            describe("getAllPlanets") {
                context("when a valid API URL is provided") {
                    it("should fetch and populate the planetList") {
                        let apiUrl = "https://example.com/api/planets"
                        
                        let stubbedResult = Result<PlanetData, Error>.success(PlanetData(results: planets))
                        mockNetworkManager.stubbedGetAllResult = Result.Publisher(stubbedResult).eraseToAnyPublisher()
                        
                        viewModel.getAllPlanets(apiUrl: apiUrl)
                        
                        expect(viewModel.filteredPlanets.count).toEventually(equal(planets.count))
                        
                        for (index, expectedPlanet) in planets.enumerated() {
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
//            describe("searchPlanets") {
//                context("when searchText is empty") {
//                    it("should return all planets") {
//                        let searchText = ""
//                        viewModel.filteredPlanets = planetsEntity
//
//                        viewModel.searchPlanets(searchText: searchText)
//
//                        expect(viewModel.filteredPlanets.count).to(equal(3))
//                    }
//                }
//
//                context("when searchText matches one planet") {
//                    it("should return the matching planet") {
//                        let searchText = "venus"
//                        viewModel.filteredPlanets = planetsEntity
//
//                        viewModel.searchPlanets(searchText: searchText)
//
//                        expect(viewModel.filteredPlanets.count).to(equal(1))
//                        expect(viewModel.filteredPlanets[0].name).to(equal("Venus"))
//                    }
//                }
//            }
        }
    }
}
