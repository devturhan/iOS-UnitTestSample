//
//  UserViewModel.swift
//  iOS-Test
//
//  Created by Ömer Turhan on 13.10.2018.
//  Copyright © 2018 Ömer Turhan. All rights reserved.
//

import Foundation

//sourcery: AutoMockable
protocol UserViewModelProtocol: UserModelDelegate {
    var delegate: UserViewModelDelegate? { get set }
    
    func fetchUser()
}

protocol UserViewModelDelegate: class {
    func userFetchOnSuccess(user: User)
    func userFetchOnError()
}

class UserViewModel: UserViewModelProtocol {
    weak var delegate: UserViewModelDelegate?
    let model: UserModelProtocol
    
    init(model: UserModelProtocol) {
        self.model = model
        model.delegate = self
    }
    
    convenience init() {
        let model = UserModel()
        self.init(model: model)
    }
    
    func fetchUser() {
        self.model.fetchUser()
    }
    
    func userFetchOnSuccess(user: User) {
        self.delegate?.userFetchOnSuccess(user: user)
    }
    
    func userFetchOnError() {
        self.delegate?.userFetchOnError()
    }
    
    
}
