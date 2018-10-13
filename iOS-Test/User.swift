//
//  User.swift
//  iOS-Test
//
//  Created by Ömer Turhan on 13.10.2018.
//  Copyright © 2018 Ömer Turhan. All rights reserved.
//

import Foundation

class User: CustomStringConvertible {
    var name: String
    var surname: String
    var age: Int
    
    var description: String {
        return "name: \(name)" + "\nSurname: \(surname)" + "\nage: \(age)"
    }
    
    init(name: String, surname: String, age: Int) {
        self.name = name
        self.surname = surname
        self.age = age
    }
    
}

extension User: Equatable {
    static func ==(lhs: User, rhs: User) -> Bool {
        guard lhs.name == rhs.name else { return false }
        guard lhs.surname == rhs.surname else { return false }
        guard lhs.age == rhs.age else { return false }
        return true
    }
}
