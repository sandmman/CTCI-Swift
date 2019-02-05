//
//  LinkedList.swift
//  CTCI
//
//  Created by Aaron Liberatore on 1/4/19.
//

import Foundation

public final class LinkedList<T: Hashable> {
    
    public class Node<T: Hashable> {
        public var next: Node?
        public weak var prev: Node?
        public var value: T
        
        public init(value: T) {
            self.value = value
        }
    }
    
    public var head: Node<T>?
    public var tail: Node<T>?
    public var size: Int = 0
    
    public init() {}
    
    public init(from arr: [T]) {
        for item in arr {
            self.append(item)
        }
    }
    
    public var toArray: [T] {
        var iterator = head
        var arr = [T]()
        while let node = iterator {
            arr.append(node.value)
            iterator = node.next
        }
        return arr
    }
    
    public var toArrayReverse: [T] {
        var iterator = tail
        var arr = [T]()
        while let node = iterator {
            arr.append(node.value)
            iterator = node.prev
        }
        return arr
    }
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    public func append(_ value: T) {
        let node = Node(value: value)
        insert(node: node, at: size)
    }
    
    public func push(_ value: T) {
        let node = Node(value: value)
        insert(node: node, at: 0)
    }
    
    public func insert(value: T, at index: Int) {
        let node = Node(value: value)
        insert(node: node, at: index)
    }
    
    public func insert(node: Node<T>, at index: Int) {
        if (index == 0 && size == 0) {
            head = node
            tail = node
        } else if (index == 0) {
            head?.prev = node
            node.next = head
            head = node
        } else if (index == size) {
            tail?.next = node
            node.prev = tail
            tail = node
        } else {
            assert(false, "Middle insert is not supported yet")
        }
        size += 1
    }
    
}
