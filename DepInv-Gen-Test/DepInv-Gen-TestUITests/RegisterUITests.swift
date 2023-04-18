//
//  RegisterUITests.swift
//  DepInv-Gen-TestUITests
//
//  Created by Glenn Ludszuweit on 18/04/2023.
//

import XCTest

final class RegisterUITests: XCTestCase {
    var app: XCUIApplication!

    override func setUpWithError() throws {
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
        
        goToRegisterScreen()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func goToRegisterScreen() {
        let authButton = app.buttons["authButton"]
        let buttonRegister = app.buttons["buttonRegister"]
        authButton.tap()
        buttonRegister.tap()
    }

    func testRegisterScreensUserBaneEmailTextFields() throws {
        let textFieldEmail = app.textFields["textFieldEmail"]
        textFieldEmail.tap()
        textFieldEmail.typeText("test@email.com")
        
        let textFieldUserName = app.textFields["textFieldUserName"]
        textFieldUserName.tap()
        textFieldUserName.typeText("iAmTested")
        
        let textFieldEnterPassword = app.secureTextFields["textFieldEnterPassword"]
        textFieldEnterPassword.tap()
        textFieldEnterPassword.typeText("password123")
        
        let textFieldRepeatPassword = app.secureTextFields["textFieldRepeatPassword"]
        textFieldRepeatPassword.tap()
        textFieldRepeatPassword.typeText("password123")
        
        XCTAssertTrue(textFieldEmail.exists)
        XCTAssertTrue(textFieldUserName.exists)
        XCTAssertTrue(textFieldEnterPassword.exists)
        XCTAssertTrue(textFieldRepeatPassword.exists)
    }
    
    func testRegisterScreensButtons() throws {
        let buttonRegisterSubmit = app.buttons["buttonRegisterSubmit"]
        XCTAssertTrue(buttonRegisterSubmit.exists)
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
