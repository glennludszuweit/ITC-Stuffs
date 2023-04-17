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
    
    override func setUpWithError() throws {
        fruitViewModel = FruitViewModel(networkManager: FakeNetworkManager())
        fruitViewModel.getFruits(urlString: "fruits") {
            self.fruits = self.fruitViewModel.fruit
        }
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        fruitViewModel = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testGetAllFruits () throws {
        let duration: Double = 3.0
        let expectation = expectation(description: "Get all fruits.")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
            XCTAssertEqual(self.fruitViewModel.fruit.count, 40)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: duration)
    }
    
    func testGetFruit () throws {
        let duration: Double = 3.0
        let expectation = expectation(description: "Get fruit nutrition.")
        let fruit = Fruit(id: 52, name: "Guava", genus: "Seeded", family: "Round fruit", order: "Some order", nutritions: Nutritions(carbohydrates: 55.0, protein: 5.5, fat: 0.6, calories: 25, sugar: 33.0))
        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
            XCTAssertEqual(self.fruits[0].id, fruit.id)
            XCTAssertNotEqual(self.fruits[0].name, fruit.name)
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
