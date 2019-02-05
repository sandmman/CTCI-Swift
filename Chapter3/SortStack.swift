//
//  SortStack.swift
//  CTCI
//
//  Created by Aaron Liberatore on 1/4/19.
//

import Foundation

struct SortStack<T: Comparable>: ProtoStack {
    
    private var stack = Stack<T>()
    private var buffer = Stack<T>()
    
    public var count: Int {
        return stack.count
    }
    
    public mutating func push(_ value: T) {
        while let storedVal = stack.peek(), storedVal < value, let popped = stack.pop() {
            buffer.push(popped)
        }
        stack.push(value)
        while let buffered = buffer.pop() {
            stack.push(buffered)
        }
    }
    
    public mutating func pop() -> T? {
        return stack.pop()
    }
    
    public func peek() -> T? {
        return stack.peek()
    }
    
    public func isEmpty() -> Bool {
        return stack.isEmpty()
    }
}
