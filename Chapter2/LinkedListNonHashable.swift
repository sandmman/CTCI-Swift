//
//  LinkedListNonHashable.swift
//  CTCI
//
//  Created by Aaron Liberatore on 2/5/19.
//


import Foundation

public final class LinkedListNoHash<T> {
    
    public class Node<T> {
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
    
    @discardableResult public func remove(_ k: Int) -> Node<T>? {
        guard 0 <= k && k <= size - 1 else {
            return nil
        }
        
        var deleted: Node<T>?
        if k == 0 && size == 1 {
            deleted = head
            head = nil
            tail = nil
        } else if k == 0 {
            deleted = head
            head?.next?.prev = nil
            head = head?.next
        } else if k == size - 1 {
            deleted = tail
            tail?.prev?.next = nil
            tail = tail?.prev
        } else {
            var index = k
            var temp = head
            while let t = temp, index != 0 {
                temp = t.next
                index -= 1
            }
            temp?.prev?.next = temp?.next
            temp?.next?.prev = temp?.prev
            deleted = temp
        }
        
        size -= 1
        return deleted
    }
}
