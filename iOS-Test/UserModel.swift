//
//  UserModel.swift
//  iOS-Test
//
//  Created by Ömer Turhan on 13.10.2018.
//  Copyright © 2018 Ömer Turhan. All rights reserved.
//

import Foundation

//sourcery: AutoMockable
protocol UserModelProtocol: class {
    var delegate: UserModelDelegate? { get set }
    
    func fetchUser()
}

protocol UserModelDelegate: class {
    func userFetchOnSuccess(user: User)
    func userFetchOnError()
}

class UserModel: UserModelProtocol {
    var service:UserServiceProtocol
    weak var delegate: UserModelDelegate?
    
    init(service: UserServiceProtocol = ServiceProvider.sharedInstance.userService) {
        self.service = service
    }
    
    func fetchUser() {
        let user = service.getUser()
        
        if user.age > 10 {
            delegate?.userFetchOnSuccess(user: user)
        }else {
            delegate?.userFetchOnError()
        }
    }
    
}
