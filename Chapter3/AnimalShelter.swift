//
//  AnimalShelter.swift
//  CTCI
//
//  Created by Aaron Liberatore on 2/5/19.
//

import Foundation

protocol Animal {
    var name: String { get }
}

struct Dog: Animal, Equatable {
    let name: String
}

struct Cat: Animal, Equatable {
    let name: String
}

protocol AnimalShelter {
    
    func adopt() -> Animal?
    
    func adopt<T>(type: T.Type) -> Animal?
    
}

/**
 Options:
 1. Super Fast - lots of customization
 
     O(1) insert
     O(1) remove
 
 2. Mulitple Queues
 
    Fixed # of animals (2)
    O(1) insert
    O(1) remove
 
    Non-fixed # of animals (S
    O(1) insert
    O(S)
 
 3. Slower and easy
 
    Iterate down the queue until you find the one you wanted and remove it.
    O(1) insert
    O(n) remove

 */
class Shelter: AnimalShelter {
    
    let animals = LinkedListNoHash<Animal>()
    
    public init() { }
   
    public func add(animal: Animal) {
        animals.append(animal)
    }
    
    public func adopt() -> Animal? {
        return animals.remove(0)?.value
    }
    
    public func adopt<T>(type: T.Type) -> Animal? {
        var head = animals.head
        var idx = 0
        while let next = head {
            if (next.value is T) {
                animals.remove(idx)
                return next.value
            }
            idx += 1
            head = next.next
        }
        return head?.value
    }
    
}
