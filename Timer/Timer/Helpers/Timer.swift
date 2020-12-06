//
//  Timer.swift
//  Timer
//
//  Created by Jose Quintero on 12/5/20.
//

import Foundation

protocol TimerDelegate {
    func tick(with current: TimeInterval, total: TimeInterval) -> Void
}

enum Identifiable: Hashable {
    case subscriber(String)
    
    func hash(into hasher: inout Hasher) {
        if case Identifiable.subscriber(let value) = self {
            hasher.combine(value)
        } else {
            hasher.combine(-1)
        }
    }
}

class Stopwatch {
    private(set) var timer: Timer? = nil
    private(set) var subscriptions: [Identifiable: TimerDelegate] = [:]
    
    private var tick: TimeInterval = 0
    
    public var isRunning: Bool = false
    
    func start(with interval: TimeInterval) {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (t) in
            self.subscriptions.forEach { (arg0) in
                let (_, value) = arg0
                value.tick(with: self.tick, total: interval)
                self.tick += 1
            }
            
            if self.tick >= interval {
                self.reset()
            }
        })
        timer?.fire()
        isRunning = true
    }
    
    func reset() {
        timer?.invalidate()
        timer = nil
        isRunning = false
    }
    
    func subscribe(_ s: TimerDelegate, with id: Identifiable) {
        subscriptions[id] = s
    }
    
    func unsubscribe(id: Identifiable) {
        subscriptions[id] = nil
    }
}
