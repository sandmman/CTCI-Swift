//
//  extensions.swift
//  CTCI
//
//  Created by Aaron Liberatore on 1/5/19.
//

import Foundation

public extension String {
    
    public subscript(i: Int) -> Character {
        return self[index(self.startIndex, offsetBy: i)]
    }
    
}

public extension Array {
    
    public func prettyPrint() {
        print("**********")
        for i in 0..<self.count {
            print(self[i])
        }
    }
}
