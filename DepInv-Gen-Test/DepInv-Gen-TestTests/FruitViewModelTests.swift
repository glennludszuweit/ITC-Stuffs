//
//  FruitTests.swift
//  DepInv-Gen-TestTests
//
//  Created by Glenn Ludszuweit on 16/04/2023.
//

import XCTest

@testable import DepInv_Gen_Test

final class FruitViewModelTests: XCTestCase {
    var fruitViewModel: FruitViewModel!
    var fruits: [Fruit]!
    var mockFruitsViewModel: FruitViewModel!
    var mockFruits: [Fruit]!
    var stubFruitsViewModel: FruitViewModel!
    var stubbedFruit: Fruit!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        fruitViewModel = nil
        fruits = nil
        mockFruitsViewModel = nil
        mockFruits = nil
        stubFruitsViewModel = nil
        stubbedFruit = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testGetAllFruits () throws {
        let duration: Double = 3.0
        let expectation = expectation(description: "Get all fruits.")

        fruitViewModel = FruitViewModel(networkManager: FakeNetworkManager())
        fruitViewModel.getFruits(urlString: "fruits") {
            self.fruits = self.fruitViewModel.fruit
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
            XCTAssertEqual(self.fruits.count, 40)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: duration)
    }
    
    func testGetFruit () throws {
        let stubNetworkManager = StubNetworkManager()
        stubNetworkManager.stubbedData = [Fruit(id: 52, name: "Guava", genus: "Seeded", family: "Round fruit", order: "Some order", nutritions: Nutritions(carbohydrates: 55.0, protein: 5.5, fat: 0.6, calories: 25, sugar: 33.0))]

        stubFruitsViewModel = FruitViewModel(networkManager: stubNetworkManager)
        stubFruitsViewModel.getFruits {
            self.stubbedFruit = stubNetworkManager.stubbedData[0]
        }
        
        fruitViewModel = FruitViewModel(networkManager: FakeNetworkManager())
        fruitViewModel.getFruits(urlString: "fruits") {
            self.fruits = self.fruitViewModel.fruit
        }

        let duration: Double = 3.0
        let expectation = expectation(description: "Get fruit nutrition.")
        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
//            XCTAssertEqual(self.fruits[0].id, self.stubbedFruit.id)
//            XCTAssertNotEqual(self.fruits[0].name, self.stubbedFruit.name)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: duration)
    }
    
    func testGetAllMockFruits () throws {
        let duration: Double = 3.0
        let expectation = expectation(description: "Get all mock fruits.")
        
        mockFruitsViewModel = FruitViewModel(networkManager: MockNetworkManager())
        mockFruitsViewModel.getFruits(urlString: "fruits") {
            self.mockFruits = self.mockFruitsViewModel.fruit
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
            XCTAssertEqual(self.mockFruitsViewModel.fruit.count, 3)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: duration)
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
