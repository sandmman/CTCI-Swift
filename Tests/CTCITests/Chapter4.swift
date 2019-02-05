//
//  Chapter4.swift
//  CTCI
//
//  Created by Aaron Liberatore on 1/5/19.
//

import Foundation
import XCTest

public class Chapter4Tests: XCTestCase {
    
    // 4.1 - Route Between Nodes
    func test4_1() {
        let graph = Graph<Int>()
        let v1 = graph.createVertex(value: 1)
        let v2 = graph.createVertex(value: 2)
        let v3 = graph.createVertex(value: 3)
        let v4 = graph.createVertex(value: 4)
        let v5 = graph.createVertex(value: 5)
        let v6 = graph.createVertex(value: 6)
        
        graph.addDirectedEdge(from: v1, to: v2, weight: 0)
        graph.addDirectedEdge(from: v2, to: v3, weight: 0)
        graph.addDirectedEdge(from: v3, to: v4, weight: 0)
        graph.addDirectedEdge(from: v4, to: v5, weight: 0)
        graph.addDirectedEdge(from: v5, to: v1, weight: 0)
        
        XCTAssertTrue(graph.existsPath(from: v1, to: v1))
        XCTAssertTrue(graph.existsPath(from: v1, to: v5))
        XCTAssertFalse(graph.existsPath(from: v1, to: v6))
    }
    
    // 4.2 - Balanced Binary Tree
    func test4_2() {
        let tests = [[], [0, 1], [0, 1, 2], [0, 1, 2, 3, 4, 5, 6, 7, 8]]
        for test in tests {
            let tree = Tree(arr: test)
            let inorder = tree.inorderTraversal()
            XCTAssertEqual(test, inorder)
        }
    }
    
    // 4.3 - List of Depths
    func test4_3() {
        let arr = [0, 1, 2, 3, 4, 5, 6, 7, 8]
        let arr2 = [1, 4, 6]
        let tree = Tree(arr: arr)
        let subTree = Tree(arr: arr2)
        let _ = tree.createLeveledLinkedList()
        print(tree.inorderTraversal())
        print(tree.postorderTraversal())
        print(tree.preorderTraversal())
        print(subTree.inorderTraversal())
        print(subTree.postorderTraversal())
        print(subTree.preorderTraversal())
        XCTFail()
    }
    
    // 4.4 - Check is Balanced
    func test4_4() {
        let arr = [0, 1, 2, 3, 4, 5, 6, 7, 8]
        let tree = Tree(arr: arr)
        print(tree)
        XCTAssertTrue(tree.isBalanced)
        
        let t2 = Tree<Int>()
        let n1 = Tree<Int>.Node(value: 1)
        let n2 = Tree<Int>.Node(value: 2)
        let n3 = Tree<Int>.Node(value: 3)
        XCTAssertTrue(t2.isBalanced)
        t2.root = n1
        XCTAssertTrue(t2.isBalanced)
        n1.left = n2
        XCTAssertTrue(t2.isBalanced)
        n2.left = n3
        XCTAssertFalse(t2.isBalanced)
    }
    
    // 4.5 - Validate BST
    func test4_5() {
        let arr = [0, 1, 2, 3, 4, 5, 6, 7, 8]
        let t1 = Tree(arr: arr)
        XCTAssertTrue(t1.isBST)
        
        let t2 = Tree<Int>()
        let n1 = Tree<Int>.Node(value: 1)
        let n2 = Tree<Int>.Node(value: 1)
        XCTAssertTrue(t2.isBST)
        t2.root = n1
        XCTAssertTrue(t2.isBST)
        n1.left = n2
        XCTAssertTrue(t2.isBST)
        n1.right = n2
        XCTAssertFalse(t2.isBST)
        
        //    20
        // 10    30
        //   25
        let t3 = Tree<Int>()
        let n10 = Tree<Int>.Node(value: 10)
        let n20 = Tree<Int>.Node(value: 20)
        let n25 = Tree<Int>.Node(value: 25)
        let n30 = Tree<Int>.Node(value: 30)
        t3.root = n20
        n20.left = n10
        n20.right = n30
        n10.right = n25
        XCTAssertFalse(t3.isBST)
    }
    
    // 4.6.1 - Find in order Successor
    // Get total in order array of NODES
    // Find the node we started with and just get the next node
    // Time : O(n + m) : O(n)
    // Space: O(n)
    func test4_6_1() {
        let arr = [0, 1, 2, 3, 4, 5, 6, 7, 8]
        let tree = Tree(arr: arr)
        for x in arr {
            guard let nodeX = tree.find(value: x) else {
                continue
            }
            let succ1 = tree.getSuccessor(from: nodeX)
            if x == 8 {
                XCTAssertNil(succ1)
            } else {
                XCTAssertEqual(succ1?.value, x + 1)
            }
        }
    }
    
    // 4.7 - Resolve dependencies
    func test4_7() {
        let arr = [0, 1, 2, 3, 4, 5, 6, 7, 8]
        let _ = Tree(arr: arr)
    }
}
