//
//  SetOfStack.swift
//  CTCI
//
//  Created by Aaron Liberatore on 1/4/19.
//

import Foundation

struct SetOfStacks<T>: ProtoStack {
    
    private var stacks = Stack<Stack<T>>()
    
    private let maxStackSize: Int
    
    public var count: Int {
        return ((stacks.count - 1) * self.maxStackSize) + (stacks.peek()?.count ?? 0)
    }
    
    public init(maxStackSize: Int) {
        self.maxStackSize = maxStackSize
    }
    
    public mutating func push(_ value: T) {
        if let lastStack = stacks.peek(),
            lastStack.count != maxStackSize,
            var last = stacks.pop() {
            last.push(value)
            stacks.push(last)
        } else {
            var stack = Stack<T>()
            stack.push(value)
            stacks.push(stack)
        }
        return
    }
    
    public mutating func pop() -> T? {
        if var stack = stacks.pop() {
            let last = stack.pop()
            if stack.count != 0 {
                stacks.push(stack)
            }
            return last
        }
        
        return nil
    }
    
    public func isEmpty() -> Bool {
        return stacks.count == 0
    }
    
    public func peek() -> T? {
        return stacks.peek()?.peek()
    }
    
    public func display() {
        for stack in stacks.arr {
            print(stack)
        }
    }
}
