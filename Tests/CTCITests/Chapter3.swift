//
//  Chapter3.swift
//  CTCI
//
//  Created by Aaron Liberatore on 1/4/19.
//

import Foundation
import XCTest

public class Chapter3: XCTestCase {
    
    // 3.1 - ThreeInOne
    func test3_1() {
        let stack = ThreeStack<Int>()
        stack.push(0, to: .one)
        stack.push(1, to: .one)
        stack.push(2, to: .one)
        
        stack.push(3, to: .two)
        stack.push(4, to: .two)
        stack.push(5, to: .two)
        
        stack.push(6, to: .three)
        stack.push(7, to: .three)
        stack.push(8, to: .three)
        
        XCTAssertEqual(2, stack.pop(from: .one))
        XCTAssertEqual(5, stack.pop(from: .two))
        XCTAssertEqual(8, stack.pop(from: .three))
        XCTAssertEqual(1, stack.pop(from: .one))
        XCTAssertEqual(4, stack.pop(from: .two))
        XCTAssertEqual(7, stack.pop(from: .three))
        XCTAssertEqual(0, stack.pop(from: .one))
        XCTAssertEqual(3, stack.pop(from: .two))
        XCTAssertEqual(6, stack.pop(from: .three))
    }
    
    // 3.2 - Stack Min
    func test3_2() {
        var minStack = MinStack<Int>()
        
        minStack.push(3)
        minStack.push(5)
        minStack.push(2)
        minStack.push(4)
        minStack.push(1)
        XCTAssertEqual(1, minStack.peekMin())
        XCTAssertEqual(1, minStack.pop())
        XCTAssertEqual(2, minStack.peekMin())
        XCTAssertEqual(4, minStack.pop())
        XCTAssertEqual(2, minStack.peekMin())
        XCTAssertEqual(2, minStack.pop())
        XCTAssertEqual(3, minStack.peekMin())
        XCTAssertEqual(5, minStack.pop())
        XCTAssertEqual(3, minStack.peekMin())
        XCTAssertEqual(3, minStack.pop())
        XCTAssertEqual(nil, minStack.peekMin())
    }
    
    // 3.3 - Stack of Plates
    func test3_3() {
        var stackOfStacks = SetOfStacks<Int>(maxStackSize: 3)
        stackOfStacks.push(0)
        stackOfStacks.push(1)
        stackOfStacks.push(2)
        stackOfStacks.push(3)
        stackOfStacks.push(4)
        stackOfStacks.push(5)
        stackOfStacks.push(6)
        
        XCTAssertEqual(6, stackOfStacks.pop())
        XCTAssertEqual(5, stackOfStacks.pop())
        XCTAssertEqual(4, stackOfStacks.pop())
        XCTAssertEqual(3, stackOfStacks.pop())
        XCTAssertEqual(2, stackOfStacks.pop())
        XCTAssertEqual(1, stackOfStacks.pop())
        XCTAssertEqual(0, stackOfStacks.pop())
    }
    
    // 3.4 Queue via Stacks
    func test3_4() {
        var queue = QueueStack<Int>()
        queue.push(0)
        queue.push(1)
        queue.push(2)
        queue.push(3)
        XCTAssertEqual(0, queue.pop())
        XCTAssertEqual(1, queue.pop())
        XCTAssertEqual(2, queue.pop())
        XCTAssertEqual(3, queue.pop())
    }
    
    // 3.5 Sort Stack
    func test3_5() {
        var stack = SortStack<Int>()
        stack.push(0)
        stack.push(2)
        stack.push(1)
        stack.push(3)
        XCTAssertEqual(0, stack.pop())
        XCTAssertEqual(1, stack.pop())
        XCTAssertEqual(2, stack.pop())
        XCTAssertEqual(3, stack.pop())
    }
    
    // 3.5 Animal Shelter
    func test3_6() {
        let shelter = Shelter()
        shelter.add(animal: Dog(name: "rufus"))
        shelter.add(animal: Cat(name: "kit"))
        shelter.add(animal: Cat(name: "tom"))
        shelter.add(animal: Dog(name: "jerry"))
        let cat = shelter.adopt(type: Cat.self)
        let dog = shelter.adopt(type: Dog.self)
        XCTAssertEqual(cat as! Cat, Cat(name: "kit"))
        XCTAssertEqual(dog as! Dog, Dog(name: "rufus"))
    }
}
