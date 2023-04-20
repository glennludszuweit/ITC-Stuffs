//
//  UIImage_UIKitTests.swift
//  UIImage-UIKitTests
//
//  Created by Glenn Ludszuweit on 19/04/2023.
//

import XCTest
@testable import UIImage_UIKit

final class ProductViewModelTests: XCTestCase {
    var productViewModel: ProductViewModel!
    var products: [Product]!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        productViewModel = nil
        products = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetAllProducts () throws {
        let duration: Double = 3.0
        let expectation = expectation(description: "Get all fruits.")

        productViewModel = ProductViewModel(networkManager: FakeNetworkManager())
        productViewModel.getProducts(urlString: "products") {
            self.products = self.productViewModel.products
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
            XCTAssertNotEqual(self.productViewModel.products.count, 40)
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
