//
//  Stack.swift
//  CTCI
//
//  Created by Aaron Liberatore on 1/4/19.
//

import Foundation

public protocol ProtoStack {
    
    associatedtype T
    
    var count: Int { get }
    
    mutating func push(_ value: T)
    
    mutating func pop() -> T?
    
    func peek() -> T?
    
    func isEmpty() -> Bool
    
}
