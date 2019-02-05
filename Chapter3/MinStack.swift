//
//  MinStack.swift
//  CTCI
//
//  Created by Aaron Liberatore on 1/4/19.
//

import Foundation

struct MinStack<T: Comparable>: ProtoStack {
    
    var arr: [T] = []
    var min: [T] = []
    
    public var count: Int {
        return arr.count
    }
    
    public mutating func push(_ value: T) {
        arr.append(value)
        
        if let currMin = min.last {
            if value <= currMin {
                min.append(value)
            }
        } else {
            min.append(value)
        }
    }
    
    public mutating func pop() -> T? {
        let removed = arr.popLast()
        if (removed == min.last) {
            return min.popLast()
        }
        return removed
    }
    
    public func peekMin() -> T? {
        return min.last
    }
    
    public func peek() -> T? {
        return arr.last
    }
    
    public func isEmpty() -> Bool {
        return arr.isEmpty
    }
}
