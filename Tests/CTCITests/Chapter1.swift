//
//  Chapter1.swift
//  CTCI
//
//  Created by Aaron Liberatore on 1/5/19.
//

import Foundation
import XCTest

public class Chapter1: XCTestCase {
    
    func generateRandom() {
        
    }
    
    func test(_ compress: (String) -> String) {
        //print(compress(""))
        _ = compress("a")
        _ = compress("aa")
        _ = compress("AAbCCC")
        _ = compress("AAbC")
        _ = compress("AbC")
        _ = compress("AbbbbbbC")
        _ = compress("AbCCAA")
        _ = compress("AbCCAbbb")
    }
    
}
