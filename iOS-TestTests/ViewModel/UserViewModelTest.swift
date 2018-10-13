//
//  UserViewModelTest.swift
//  iOS-TestTests
//
//  Created by Ömer Turhan on 13.10.2018.
//  Copyright © 2018 Ömer Turhan. All rights reserved.
//

import XCTest
import SwiftyMocky

class UserViewModelTest: XCTestCase {

    let mockUserViewController = UserViewControllerProtocolMock()
    var mockUserService =  UserServiceProtocolMock()
    var sut: UserViewModel!
    
    override func setUp() {
        ServiceProvider.sharedInstance.userService = mockUserService
        let sut = UserViewModel()
        sut.delegate = mockUserViewController
        self.sut = sut
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFetchUser_ReturnFailWhenUserAgeBiggerThan10() {
        //Given
        let user = User(name: "omer", surname: "TURHAN", age: 13)
        Given(mockUserService, .getUser(willReturn: user))
        
        //When
        sut.fetchUser()
        
        //Then
        Verify(mockUserViewController, .userFetchOnSuccess(user: .value(user)))
    }
    
    func testFetchUser_ReturnFailWhenUserAgeLowerThan10() {
        //Given
        let user = User(name: "omer", surname: "TURHAN", age: 9)
        Given(mockUserService, .getUser(willReturn: user))
        
        //When
        sut.fetchUser()
        
        //Then
        Verify(mockUserViewController, .userFetchOnError())
    }
    
    
}
