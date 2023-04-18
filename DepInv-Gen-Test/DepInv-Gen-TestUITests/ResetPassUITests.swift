//
//  ResetPassUITests.swift
//  DepInv-Gen-TestUITests
//
//  Created by Glenn Ludszuweit on 18/04/2023.
//

import XCTest

final class ResetPassUITests: XCTestCase {
    var app: XCUIApplication!

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
        goToResetPassScreen()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func goToResetPassScreen() {
        let authButton = app.buttons["authButton"]
        let buttonResetPass = app.buttons["buttonResetPass"]
        authButton.tap()
        buttonResetPass.tap()
    }

    func testResetPassScreenTextFields() throws {
        let textFieldResetEmail = app.textFields["textFieldResetEmail"]
        textFieldResetEmail.tap()
        textFieldResetEmail.typeText("test@email.com")
    }
    
    func testResetPassScreenButtons() throws {
        let buttonResetPassSubmit = app.buttons["buttonResetPassSubmit"]
        XCTAssertTrue(buttonResetPassSubmit.exists)
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
