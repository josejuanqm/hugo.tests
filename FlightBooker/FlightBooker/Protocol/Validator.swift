//
//  DateValidator.swift
//  FlightBooker
//
//  Created by Jose Quintero on 12/4/20.
//

import Foundation

protocol Validator {
    associatedtype T
    
    func validate(value: T) -> Bool
}
