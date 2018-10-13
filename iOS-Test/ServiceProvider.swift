//
//  File.swift
//  iOS-Test
//
//  Created by Ömer Turhan on 13.10.2018.
//  Copyright © 2018 Ömer Turhan. All rights reserved.
//

import Foundation

class ServiceProvider {
    static let sharedInstance = ServiceProvider()
    var userService: UserServiceProtocol
    
    private init () {
        userService = UserService()
    }
    
    
}
