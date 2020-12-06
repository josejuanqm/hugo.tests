//
//  Counter.swift
//  Counter
//
//  Created by Jose Quintero on 12/4/20.
//

import Foundation

enum CounterStep {
    case value(Int)
}

class DataSource {
    var count: Int = 0
    
    func advanced(by amount: Int) {
        count += amount
    }
}

class Counter {
    private let dataSource = DataSource()
    
    var value: Int
    {
        get {
            return dataSource.count
        }
    }
    
    func advance(by value: CounterStep = .value(1)) {
        if case .value(let amount) = value {
            dataSource.advanced(by: amount)
        }
    }
}
