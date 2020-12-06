//
//  Person.swift
//  CRUD
//
//  Created by Jose Quintero on 12/5/20.
//

import Foundation

struct Person: Codable {
    typealias Details = (firstName: String, lastName: String)
    
    var firstName: String
    var lastName: String
    
    mutating func update(with details: Details) {
        firstName = details.firstName
        lastName = details.lastName
    }
}
