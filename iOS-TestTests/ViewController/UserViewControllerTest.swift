//
//  UserViewControllerTest.swift
//  iOS-TestTests
//
//  Created by Ömer Turhan on 13.10.2018.
//  Copyright © 2018 Ömer Turhan. All rights reserved.
//

import XCTest
import SwiftyMocky

class UserViewControllerTest: XCTestCase {

    var mockService = UserServiceProtocolMock()
    var sut: UserViewController!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        ServiceProvider.sharedInstance.userService = mockService
        
        let sut = UserViewController.instantiate()
        sut.loadViewIfNeeded()
        self.sut = sut
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_UserFetchOnSuccess() {
        //Given
        let user = User(name: "Omer", surname: "Turhan", age: 12)
        
        //When
        sut.userFetchOnSuccess(user: user)
        
        //Then
        XCTAssertEqual(sut.label.text, user.description)
    }

    func test_UserFetchOnError() {
        //When
        sut.userFetchOnError()
        
        //Then
        XCTAssertEqual(sut.label.text, "ERROR")
    }
    
    func test_ViewDidAppear() {
        //Given
        let user = User(name: "test", surname: "Turhan", age: 12)
        Given(mockService, .getUser(willReturn: user))
        
        //When
        sut.viewDidAppear(false)
        
        //Then
        XCTAssertEqual(sut.label.text, user.description)
    }
    
}
