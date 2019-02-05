//
//  Solutions.swift
//  CTCI
//
//  Created by Aaron Liberatore on 1/6/19.
//

import Foundation

public extension LinkedList {
    
    // 2.1 Remove dups
    public func removeDupsTemporaryBuffer() -> LinkedList {
        var temp = head
        var buffer = Set<T>()
        while let t = temp {
            if (buffer.contains(t.value)) {
                t.prev?.next = t.next
                t.next?.prev = t.prev
            }
            buffer.insert(t.value)
            temp = t.next
        }
        return self
    }
    
    // 2.1 Without a buffer
    public func removeDupsNoTemporaryBuffer() -> LinkedList {
        /// Iterate n2 boom solved
        return self
    }
    
    // 2.2 Iterate forwards count - k times
    // If no size, iterate through it to find the end then size - k
    public func getkthToLastSinglyLinked(_ k: Int) -> T? {
        guard k >= 0, k <= size - 1 else {
            return nil
        }
        
        var kth = size - 1 - k
        var last = head
        while last != nil && kth != 0 {
            kth -= 1
            last = last?.next
        }
        return last?.value
    }
    
    // 2.2 Iterate backwards k times
    public func getkthToLastDoublyLinked(_ k: Int) -> T? {
        guard k >= 0, k <= size - 1 else {
            return nil
        }
        
        var kth = k
        var last = tail
        while last != nil && kth != 0 {
            kth -= 1
            last = last?.prev
        }
        return last?.value
    }
    
    // 2.3 Delete node
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
    
    // 2.4 Partition: Write code to partition a linked list around a value x, such that all nodes less than x come before all nodes greater than or equal to x.
    // If x is contained within the list, the values of x only need to be after the elements less than x (see below).
    // The partition element x can appear anywhere in the "right partition"; it does not need to appear between the left and right partitions.
    public func partition(by value: T) -> LinkedList {
        return self
    }
    
    // 2.6 Palindrome: Implement a function to check if a linked list is a palindrome.
    public var isPalindrome: Bool {
        var left = head
        var right = tail
        for _ in 0..<Int(size/2) {
            if (left?.value != right?.value) {
                return false
            }
            left = left?.next
            right = right?.prev
        }
        return true
    }
    
    // 2.6 Palindrome: Implement a function to check if a linked list is a palindrome.
    public var isCircular: T? {
        var slow = head
        var fast = head?.next
        while slow != nil && fast != nil && slow !== fast {
            slow = slow?.next
            fast = fast?.next?.next
        }
        return slow === fast ? slow?.value : nil
    }
}

// 2.5 Sum Lists:
public func sumLinkedLists(l1: LinkedList<Int>, l2: LinkedList<Int>) -> LinkedList<Int> {
    let ll = LinkedList<Int>()
    var l1Last = l1.tail
    var l2Last = l2.tail
    var carry = 0
    while l1Last != nil || l2Last != nil {
        let sum = (l1Last?.value ?? 0) + (l2Last?.value ?? 0) + carry
        ll.push(sum % 10)
        carry = Int(sum / 10)
        l1Last = l1Last?.prev
        l2Last = l2Last?.prev
    }
    return ll
}

// 2.7 Intersection: Given two (singly) linked lists, determine if the two lists intersect. Return the inter­ secting node
public func inserect(l1: LinkedList<Int>, l2: LinkedList<Int>) -> Bool {
    return false
}
