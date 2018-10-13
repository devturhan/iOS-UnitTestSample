//
//  UserService.swift
//  iOS-Test
//
//  Created by Ömer Turhan on 13.10.2018.
//  Copyright © 2018 Ömer Turhan. All rights reserved.
//

import Foundation

//sourcery: AutoMockable
protocol UserServiceProtocol: class {
    func getUser() -> User
}

class UserService: UserServiceProtocol {
    
    func getUser() -> User {
        return User(name: "Omer", surname: "Turhan", age: 123)
    }
    
}
