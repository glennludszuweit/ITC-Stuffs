//
//  ProductsViewUITests.swift
//  UIImage-UIKitUITests
//
//  Created by Glenn Ludszuweit on 20/04/2023.
//

import XCTest

final class ProductsViewUITests: XCTestCase {
    var app: XCUIApplication!

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testProductsTableCellElementsExist() throws {
        let productThumbnail = app.images["productThumbnail"]
        let productLabel = app.staticTexts["productLabel"]
        XCTAssertTrue(productThumbnail.exists)
        XCTAssertTrue(productLabel.exists)
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
