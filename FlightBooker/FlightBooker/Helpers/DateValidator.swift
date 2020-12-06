//
//  DateValidator.swift
//  FlightBooker
//
//  Created by Jose Quintero on 12/4/20.
//

import Foundation

class DateValidator: Validator {
    typealias T = String
    
    let dateFormatter: DateFormatter = DateFormatter()
    
    init() {
        dateFormatter.dateFormat = "dd-mm-yyy"
    }
    
    func validate(value: String) -> Bool {
        guard let _ = dateFormatter.date(from: value) else {
            return false
        }
        
        return true
    }
    
    func validate(value: String, bound: String) -> Bool {
        guard
            let date = dateFormatter.date(from: value),
            let bound = dateFormatter.date(from: bound)
        else {
            return false
        }
        
        return date > bound
    }
}
