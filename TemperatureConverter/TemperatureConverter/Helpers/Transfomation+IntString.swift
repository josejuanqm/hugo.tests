//
//  Transfomation+IntString.swift
//  TemperatureConverter
//
//  Created by Jose Quintero on 12/4/20.
//

import Foundation

class IntStringTransformation: Transformation {
    typealias T = String
    typealias V = Int
    
    func tranform(value: T) -> V {
        return Int(value) ?? 0
    }
    
    func invertTranform(value: V) -> T {
        return value.description
    }
}
