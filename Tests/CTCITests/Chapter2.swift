//
//  Chapter1Tests.swift
//  CTCI
//
//  Created by Aaron Liberatore on 1/4/19.
//

import Foundation
import XCTest
import CTCI

public class Chapter2: XCTestCase {
    
    static let defaultArr = [0, 1, 2, 3]
    
    /// Validate Linked List
    func test2_0() {
        let linkedlist = LinkedList(from: Chapter2.defaultArr)
        XCTAssertEqual(linkedlist.toArray, Chapter2.defaultArr)
    }
    
    /// Remove Dups!
    /// Write code to remove duplicates from an unsorted linked list.
    /// FOLLOW UP
    /// How would you solve this problem if a temporary buffer is not allowed?
    func test2_1() {
        let empty: LinkedList<Int> = LinkedList(from: [])
        let one = LinkedList(from: [0])
        let beginning = LinkedList(from: [0, 0, 1, 2])
        let middle = LinkedList(from: [0, 1, 1, 2])
        let last = LinkedList(from: [0, 1, 2, 2])
        
        XCTAssertEqual(empty.removeDupsTemporaryBuffer().toArray, [])
        XCTAssertEqual(one.removeDupsTemporaryBuffer().toArray, [0])
        XCTAssertEqual(middle.removeDupsTemporaryBuffer().toArray, [0, 1, 2])
        XCTAssertEqual(beginning.removeDupsTemporaryBuffer().toArray, [0, 1, 2])
        XCTAssertEqual(middle.removeDupsTemporaryBuffer().toArray, [0, 1, 2])
        XCTAssertEqual(last.removeDupsTemporaryBuffer().toArray, [0, 1, 2])
    }
    
    /// Return Kth to Last:
    /// Implement an algorithm to find the kth to last element of a singly linked list
    func test2_2() {
        let ll = LinkedList(from: Chapter2.defaultArr)
        
        XCTAssertEqual(ll.getkthToLastDoublyLinked(0), 3)
        XCTAssertEqual(ll.getkthToLastDoublyLinked(1), 2)
        XCTAssertEqual(ll.getkthToLastDoublyLinked(2), 1)
        XCTAssertEqual(ll.getkthToLastDoublyLinked(3), 0)
        XCTAssertEqual(ll.getkthToLastDoublyLinked(4), nil)
        XCTAssertEqual(ll.getkthToLastDoublyLinked(-1), nil)
        
        XCTAssertEqual(ll.getkthToLastSinglyLinked(0), 3)
        XCTAssertEqual(ll.getkthToLastSinglyLinked(1), 2)
        XCTAssertEqual(ll.getkthToLastSinglyLinked(2), 1)
        XCTAssertEqual(ll.getkthToLastSinglyLinked(3), 0)
        XCTAssertEqual(ll.getkthToLastSinglyLinked(4), nil)
        XCTAssertEqual(ll.getkthToLastSinglyLinked(-1), nil)
    }
    
    // Delete Node
    func test2_3() {
        
        // Remove out of bounds
        let empty: LinkedList<Int> = LinkedList(from: [])
        XCTAssertEqual(empty.remove(0)?.value, nil)
        
        // Remove only Node
        let one = LinkedList(from: [0])
        XCTAssertEqual(one.remove(1)?.value, nil)
        XCTAssertEqual(one.remove(2)?.value, nil)
        XCTAssertEqual(one.remove(0)?.value, 0)
        XCTAssertEqual(one.head?.value, nil)
        XCTAssertEqual(one.tail?.value, nil)
        
        // Remove First
        let arr1 = LinkedList(from: Chapter2.defaultArr)
        XCTAssertEqual(arr1.remove(0)?.value, 0)
        XCTAssertEqual(arr1.toArray, [1, 2, 3])
        XCTAssertEqual(arr1.toArrayReverse, [3, 2, 1])
        
        // Remove Last
        let arr2 = LinkedList(from: Chapter2.defaultArr)
        XCTAssertEqual(arr2.remove(3)?.value, 3)
        XCTAssertEqual(arr2.toArray, [0, 1, 2])
        XCTAssertEqual(arr2.toArrayReverse, [2, 1, 0])
        
        // Remove Middle
        let arr3 = LinkedList(from: Chapter2.defaultArr)
        XCTAssertEqual(arr3.remove(1)?.value, 1)
        XCTAssertEqual(arr3.toArray, [0, 2, 3])
        XCTAssertEqual(arr3.toArrayReverse, [3, 2, 0])
    }
    
    // Sum Nodes
    func test2_5() {
        let v93 = LinkedList(from: [9, 3])
        let v229 = LinkedList(from: [2, 2, 9])
        let sum = sumLinkedLists(l1: v93, l2: v229)
        XCTAssertEqual(sum.toArray, [3, 2, 2])
    }
    
    // isPalindrome
    func test2_6() {
        let empty: LinkedList<Int> = LinkedList(from: [])
        let one = LinkedList(from: [1])
        let odd = LinkedList(from: [1, 2, 3, 2, 1])
        let even = LinkedList(from: [1, 2, 3, 3, 2, 1])
        let notPal = LinkedList(from: [1, 2, 3, 1])
        XCTAssertTrue(empty.isPalindrome)
        XCTAssertTrue(one.isPalindrome)
        XCTAssertTrue(odd.isPalindrome)
        XCTAssertTrue(even.isPalindrome)
        XCTAssertFalse(notPal.isPalindrome)
    }
    
    func test2_7() {
    }
    
    func test2_8() {
        let ll = LinkedList(from: [0, 1, 2, 3, 5, 6])
        ll.tail?.next = ll.head
        ll.head?.prev = ll.tail
        XCTAssertEqual(ll.isCircular, 6)
    }
}
