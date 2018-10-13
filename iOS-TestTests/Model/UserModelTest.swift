//
//  UserModelTest.swift
//  iOS-TestTests
//
//  Created by Ömer Turhan on 13.10.2018.
//  Copyright © 2018 Ömer Turhan. All rights reserved.
//

import XCTest
import SwiftyMocky
@testable import iOS_Test

class UserModelTest: XCTestCase {

    var mockUserService =  UserServiceProtocolMock()
    var mockUserViewModel = UserViewModelProtocolMock()
    var sut: UserModel!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        ServiceProvider.sharedInstance.userService = mockUserService
        let sut = UserModel()
        sut.delegate = mockUserViewModel
        self.sut = sut
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFetchUser_ReturnFailWhenUserAgeBiggerThan10() {
        //Given
        let user = User(name: "Ayse", surname: "Turhan", age: 12)
        Given(mockUserService, .getUser(willReturn: user))
        
        //When
        sut.fetchUser()

        //Then
        Verify(mockUserViewModel, .userFetchOnSuccess(user: .value(user)))
    }

    func testFetchUser_ReturnFailWhenUserAgeLowerThan10() {
        //Given
        let user = User(name: "Omer", surname: "Turhan", age: 1)
        Given(mockUserService, .getUser(willReturn: user))
        
        //When
        sut.fetchUser()
        
        //Then
        Verify(mockUserViewModel, .userFetchOnError())
    }
    
    
}
