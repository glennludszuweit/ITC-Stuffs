//
//  PokemonDetailsTests.swift
//  WorkingWithAPI-SwiftUIUITests
//
//  Created by Glenn Ludszuweit on 26/04/2023.
//

import XCTest

final class PokemonDetailsTests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {}

    func testExample() throws {
        let app = XCUIApplication()
        app.launch()

        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            let firstEl = app.images["pl1-1"]
            firstEl.tap()
            let detailsImg = app.images["https://images.pokemontcg.io/pl1/1_hires.png"]
            
            XCTAssertTrue(firstEl.exists)
            XCTAssertTrue(detailsImg.exists)
        }
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
