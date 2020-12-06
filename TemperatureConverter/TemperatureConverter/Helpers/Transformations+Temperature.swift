//
//  Transformations+Temperature.swift
//  TemperatureConverter
//
//  Created by Jose Quintero on 12/4/20.
//

import Foundation

class TemperatureTransformation: Transformation {
    typealias T = Int
    typealias V = Int
    
    func tranform(value: T) -> V {
        return (value * 9/5) + 32
    }
    
    func invertTranform(value: V) -> T {
        return (value - 32) * 5/9
    }
}
