//
//  Tranformation+Date.swift
//  FlightBooker
//
//  Created by Jose Quintero on 12/4/20.
//

import Foundation

class DateTransformation: Transformation {
    typealias T = String
    typealias V = Date
    
    let formatter = DateFormatter()
    
    init(format: String) {
        formatter.dateFormat = format
    }
    
    func tranform(value: String) -> Date {
        return formatter.date(from: value) ?? Date()
    }
    
    func invertTranform(value: Date) -> String {
        return formatter.string(from: value)
    }
}
