//
//  QueueStack.swift
//  CTCI
//
//  Created by Aaron Liberatore on 1/4/19.
//

import Foundation

public struct QueueStack<T> {    
    
    var inStack = Stack<T>()
    var outStack = Stack<T>()
    
    public var count: Int {
        return inStack.count + outStack.count
    }
    
    public func isEmpty() -> Bool {
        return inStack.isEmpty() && outStack.isEmpty()
    }
    
    public mutating func push(_ value: T) {
        inStack.push(value)
    }
    
    public mutating func pop() -> T? {
        checkStackSwap()
        return outStack.pop()
    }
    
    public mutating func peek() -> T? {
        checkStackSwap()
        return outStack.peek()
    }
    
    private mutating func checkStackSwap() {
        if outStack.isEmpty() {
            while let val = inStack.pop() {
                outStack.push(val)
            }
        }
    }
}
