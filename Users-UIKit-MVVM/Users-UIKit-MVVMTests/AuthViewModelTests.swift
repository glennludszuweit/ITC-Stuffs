//
//  AuthViewModelTests.swift
//  Users-UIKit-MVVMTests
//
//  Created by Glenn Ludszuweit on 13/04/2023.
//

import XCTest
@testable import Users_UIKit_MVVM

final class AuthViewModelTests: XCTestCase {
    let authViewModel = AuthViewModel()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testValidateAdminUser() throws {
        let email = "test-admin@test.com"
        let pass = "password!"
        let result = authViewModel.validateAdminUser(email: email, pass: pass)
        XCTAssertTrue(result)
    }
    
    func testInvalidateAdminUser() throws {
        let email = "test.test.com"
        let pass = "password!"
        let result = authViewModel.validateAdminUser(email: email, pass: pass)
        XCTAssertFalse(result)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
