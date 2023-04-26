//
//  WorkingWithAPI_SwiftUIUITests.swift
//  WorkingWithAPI-SwiftUIUITests
//
//  Created by Glenn Ludszuweit on 24/04/2023.
//

import XCTest

@MainActor
final class PokemonGalleryTests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {}

    func testPokemonGalleryImages() throws {
        let app = XCUIApplication()
        app.launch()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            let firstEl = app.images["pl1-1"]
            firstEl.tap()
            XCTAssertTrue(firstEl.exists)
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
