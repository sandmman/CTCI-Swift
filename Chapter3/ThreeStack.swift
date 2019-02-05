//
//  ThreeStack.swift
//  CTCI
//
//  Created by Aaron Liberatore on 1/4/19.
//

import Foundation

class ThreeStack<T> {
    
    var stackSize1: Int = 0 // 0, 3, 6
    var stackSize2: Int = 0 // 1, 4, 7
    var stackSize3: Int = 0 // 2, 5, 8
    var arr: [T?] = Array(repeating: nil, count: 3)
    
    enum Stack: Int {
        case one = 0
        case two = 1
        case three = 2
    }
    
    func push(_ value: T, to stack: Stack) {
        let stackSize = getSize(of: stack)
        let nextIdx = stackSize == 0 ? stack.rawValue : stack.rawValue + (stackSize * 3)
        adjustSize(of: stack, by: 1)
        adjustArr(to: nextIdx)
        arr[nextIdx] = value
    }
    
    func pop(from stack: Stack) -> T? {
        let stackSize = getSize(of: stack)
        if (stackSize == 0) {
            return nil
        }
        let popIdx = stack.rawValue + ((stackSize - 1) * 3)
        adjustSize(of: stack, by: -1)
        return arr[popIdx]
    }
    
    private func getSize(of stack: Stack) -> Int {
        switch stack {
        case .one: return stackSize1
        case .two: return stackSize2
        case .three: return stackSize3
        }
    }
    
    private func adjustSize(of stack: Stack, by value: Int) {
        switch stack {
        case .one: stackSize1 += value
        case .two: stackSize2 += value
        case .three: stackSize3 += value
        }
    }
    
    private func adjustArr(to index: Int) {
        if (arr.count > index) {
            return
        }
        arr.append(contentsOf: [nil, nil, nil])
    }
}
