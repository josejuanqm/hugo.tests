//
//  Tranformation.swift
//  TemperatureConverter
//
//  Created by Jose Quintero on 12/4/20.
//

import Foundation

protocol Transformation {
    associatedtype T
    associatedtype V
    
    func tranform(value: T) -> V
    func invertTranform(value: V) -> T
}
