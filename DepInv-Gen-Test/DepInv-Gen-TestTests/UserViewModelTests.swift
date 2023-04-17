//
//  UserTests.swift
//  DepInv-Gen-TestTests
//
//  Created by Glenn Ludszuweit on 16/04/2023.
//

import XCTest
@testable import DepInv_Gen_Test

final class UserViewModelTests: XCTestCase {
    var userViewModel: UserViewModel!
    var users: [User]!
    var user: User!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        userViewModel = nil
        users = nil
        user = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testGetAllUsers () throws {
        let duration: Double = 3.0
        let expectation = expectation(description: "Get all users.")
        
        userViewModel = UserViewModel(networkManager: FakeNetworkManager())
        self.userViewModel.getUsers(urlString: "users") {
            self.users = self.userViewModel.users
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
            XCTAssertEqual(self.users.count, 10)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: duration)
    }
    
    func testGetFristUserName () throws {
        let duration: Double = 3.0
        let expectation = expectation(description: "Get first user name.")
        
        userViewModel = UserViewModel(networkManager: FakeNetworkManager())
        self.userViewModel.getUsers(urlString: "users") {
            self.users = self.userViewModel.users
        }
        self.user = userViewModel.users[0]
        
        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
            let user = self.users[0]
            XCTAssertEqual(user.name, "Leanne Graham")
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: duration)
    }
    
    func testGetUserEmailAndUserName () throws {
        let expectation = expectation(description: "Get user email and username.")
        XCTAssertEqual(self.user.username, "Bret")
        XCTAssertEqual(self.user.email, "Sincere@april.biz")
        expectation.fulfill()
        wait(for: [expectation])
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
