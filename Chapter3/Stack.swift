//
//  Stack.swift
//  CTCI
//
//  Created by Aaron Liberatore on 1/4/19.
//

import Foundation

public struct Stack<T>: ProtoStack {
    
    public var arr: [T] = []
    
    public var count: Int {
        return arr.count
    }
    
    public mutating func push(_ value: T) {
        arr.append(value)
    }
    
    public mutating func pop() -> T? {
        return arr.popLast()
    }
    
    public func peek() -> T? {
        return arr.last
    }
    
    public func isEmpty() -> Bool {
        return arr.isEmpty
    }
    
}
