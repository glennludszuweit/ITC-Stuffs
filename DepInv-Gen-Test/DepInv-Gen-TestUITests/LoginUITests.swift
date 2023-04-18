//
//  LoginUITests.swift
//  DepInv-Gen-TestUITests
//
//  Created by Glenn Ludszuweit on 18/04/2023.
//

import XCTest

final class LoginUITests: XCTestCase {
    var app: XCUIApplication!

    override func setUpWithError() throws {
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
        
        goToLoginScreen()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func goToLoginScreen() {
        let authButton = app.buttons["authButton"]
        authButton.tap()
    }

    func testLoginScreenTextFields() throws {
        let textFieldEmailUsername = app.textFields["textFieldEmailUsername"]
        textFieldEmailUsername.tap()
        textFieldEmailUsername.typeText("test@email.com")
        
        let textFieldPassword = app.secureTextFields["textFieldPassword"]
        textFieldPassword.tap()
        textFieldPassword.typeText("password123")
        
        XCTAssertTrue(textFieldEmailUsername.exists)
        XCTAssertTrue(textFieldPassword.exists)
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testLoginScreenButtons() throws {
        let buttonForgotPassword = app.buttons["buttonForgotPassword"]
        let buttonRegister = app.buttons["buttonRegister"]
        let buttonLoginSubmit = app.buttons["buttonLoginSubmit"]
        XCTAssertTrue(buttonForgotPassword.exists)
        XCTAssertTrue(buttonRegister.exists)
        XCTAssertTrue(buttonLoginSubmit.exists)
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
