//
//  Tree.swift
//  CTCI
//
//  Created by Aaron Liberatore on 1/5/19.
//

import Foundation

class Tree<T> where T: Hashable, T: Comparable {
    
    class Node<T>: CustomStringConvertible {
        
        public let value: T
        public var left: Node<T>?
        public var right: Node<T>?
        public var parent: Node<T>?
        
        public var description: String {
            return "Node \(value)"
        }
        
        init(value: T) {
            self.value = value
        }
    }
    
    public var root: Node<T>? = nil
    
    public init() {}
    
    public func insert(value: T) {
        let node = Node(value: value)
        guard let root = self.root else {
            self.root = node
            return
        }
        self.insert(node: node, at: root)
    }

    public func find(value: T) -> Node<T>? {
        func iterator(node: Node<T>?) -> Node<T>? {
            guard let node = node else {
                return nil
            }
            if node.value == value {
                return node
            }
            return iterator(node: node.left) ?? iterator(node: node.right);
        }
        return iterator(node: root)
    }
}

extension Tree: CustomStringConvertible {
    
    public var description: String {
        let arrs = createLeveledLinkedList()
        var str = ""
        for key in 0..<arrs.count {
            let val = arrs[key]
            str += "Level \(key) : \(val!.toArray.map({$0 == nil ? "null" : "\($0!)"}))\n"
        }
        return str
    }
}

// 4.2
extension Tree {
    
    public convenience init(arr: [T]) {
        self.init()
        root = createMinimalBST(start: 0, end: arr.count - 1, arr: arr, parent: nil)
    }
    
    func createMinimalBST(start: Int, end: Int, arr: [T], parent: Node<T>?) -> Node<T>? {
        guard end >= start else {
            return nil
        }
        
        let mid = (end + start) / 2
        let node = Node(value: arr[mid])
        node.parent = parent
        node.left = createMinimalBST(start: start, end: mid - 1, arr: arr, parent: node)
        node.right = createMinimalBST(start: mid + 1, end: end, arr: arr, parent: node)
        return node
    }
}

// 4.3
extension Tree {
    
    public func createLeveledLinkedList() -> [Int: LinkedList<T?>] {
        var lls = [Int: LinkedList<T?>]()
        createLeveledLinkedList(node: root, lls: &lls, depth: 0)
        return lls
    }
    
    private func createLeveledLinkedList(node: Node<T>?, lls: inout [Int: LinkedList<T?>], depth: Int) {
        if lls[depth] == nil {
            lls[depth] = LinkedList<T?>()
        }
    
        lls[depth]?.append(node?.value)
        // Guard after append so we always can see null nodes
        guard let node = node else {
            return
        }
        createLeveledLinkedList(node: node.left, lls: &lls, depth: depth + 1)
        createLeveledLinkedList(node: node.right, lls: &lls, depth: depth + 1)
    }
}

// 4.4
extension Tree {
    
    public var isBalanced: Bool {
        return isBalanced(root: root).result
    }
    
    private func isBalanced(root: Node<T>?, depth: Int = 0) -> (result: Bool, depth: Int) {
        guard let root = root else {
            return (true, depth)
        }
        
        let left = isBalanced(root: root.left, depth: depth + 1)
        let right = isBalanced(root: root.right, depth: depth + 1)
        return (abs(left.depth - right.depth) <= 1, max(left.depth, right.depth))
    }
}

// 4.5
extension Tree {
    
    public var isBST: Bool {
        return isBST(root: root, currentMin: nil, currentMax: nil)
    }
    
    // All the nodes on the left have to be less than all the nodes on the right and vice versa
    private func isBST(root: Node<T>?, currentMin: T?, currentMax: T?) -> Bool {
        guard let root = root else {
            return true
        }
        
        if let currentMin = currentMin, root.value <= currentMin {
            return false
        }
        
        if let currentMax = currentMax, root.value > currentMax {
            return false
        }
        
        return
            isBST(root: root.left, currentMin: currentMin, currentMax: root.value) &&
            isBST(root: root.right, currentMin: root.value, currentMax: currentMax)
    }
}

// 4.6
extension Tree {
    
    // Gets the next node in an inorder tree traversal
    // - The given node represents the current mark. So we will try to find the next node by going "right"
    // Inorder traversal
    //  left
    //  current
    //  right
    public func getSuccessor(from node: Node<T>) -> Node<T>? {
        if let right = node.right {
            // If a right node exists, we need to get the first node from the in order traversal of the right sub tree
            return getNextLeftNode(from: right)
        } else {
            // If we can't go right, we have to go up
            return getNextCurrentNode(from: node)
        }
        
    }
    
    // Called when the current node finished a left subtree and iterates to find the origin parent
    private func getNextCurrentNode(from node: Node<T>) -> Node<T>? {
        guard let parent = node.parent else {
            return nil
        }
        
        // If we're coming from the left sub tree, we can return the current node
        if parent.left?.value == node.value {
            return parent
        }
        
        // Otherwise were still in a right subtree and have to recurse upwards
        return getNextCurrentNode(from: parent)
    }
    
    // Called when the current node is the parent of a full tree and searches the right subtree to find the next node
    private func getNextLeftNode(from node: Node<T>?) -> Node<T>? {
        guard var node = node else {
            return nil
        }
        while let left = node.left {
            node = left
        }
        
        return node
    }
}
  
extension Tree {
    
    func insert(node: Node<T>, at root: Node<T>) {
//        let side = node.value > root.value ? \Node<T>.right : \Node<T>.left
//        if let side = root[side] {
//            insert(node: node, at: side)
//        } else {
//            node.parent = root
//            root[side] = node
//        }
//
        if node.value > root.value {
            if let right = root.right {
                insert(node: node, at: right)
            } else {
                node.parent = root
                root.right = node
            }
        } else {
            if let left = root.left {
                insert(node: node, at: left)
            } else {
                node.parent = root
                root.left = node
            }
        }
    }
}

extension Tree {
    
    public func preorderTraversal() -> [T] {
        var visited = [T]()
        func iterator(node: Node<T>?) {
            guard let node = node else {
                return
            }
            visited.append(node.value)
            iterator(node: node.left)
            iterator(node: node.right)
        }
        iterator(node: root)
        return visited
    }
    
    public func inorderTraversal() -> [T] {
        var visited = [T]()
        func iterator(node: Node<T>?) {
            guard let node = node else {
                return
            }
            iterator(node: node.left)
            visited.append(node.value)
            iterator(node: node.right)
        }
        iterator(node: root)
        return visited
    }
    
    public func postorderTraversal() -> [T] {
        var visited = [T]()
        func iterator(node: Node<T>?) {
            guard let node = node else {
                return
            }
            iterator(node: node.left)
            iterator(node: node.right)
            visited.append(node.value)
        }
        iterator(node: root)
        return visited
    }
}

