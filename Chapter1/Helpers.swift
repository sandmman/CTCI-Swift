//
//  Helpers.swift
//  CTCI
//
//  Created by Aaron Liberatore on 1/5/19.
//

import Foundation

// One Away
// There are 3 types of edits on strings: insert, remove or replace a character
// editCount if insert, remove = diff length
// editCount if replace = same length
// func (s1, s2) -> bool (true: (0,1) edits away)
func isOneAway(str1: String, str2: String ) -> Bool {
    //    print(str1, " ", str2)
    
    // first check if length difference is (0,1)
    if ( abs(str1.count - str2.count) > 1) {
        return false
    }
    
    // now we go through both words one by one
    var editCount: Int = 0
    var i = 0, j = 0
    while ( (i < str1.count && j < str2.count)) {
        //        print("Next = \(i)[\(str1[i])], \(j)[\(str2[j])], ", editCount)
        
        if (editCount > 1) {
            //            print("too many edits")
            break
        }
        if (str1[i] == str2[j]) {
            i += 1
            j += 1
            //            print("same (\(i), \(j))")
        } else {
            // if diff lengths
            if ( str1.count < str2.count) {
                // extra letter in str2
                // so move j forward
                j += 1
            } else if (str2.count < str1.count) {
                // extra letter in str1
                // so move i forward
                i += 1
            } else {
                // same length
                // replace
                i += 1
                j += 1
            }
            //            print("(\(i), \(j))")
            editCount += 1
        }
        if ( i > str1.count || j > str2.count) {
            editCount += 1
        }
        
    }
    
    return (editCount > 1 ? false : true )
}

func testOneAway() {
    
    assert(isOneAway(str1: "play", str2: "pls")  == false)
    assert(isOneAway(str1: "play", str2: "quality") == false)
    assert(isOneAway(str1: "play", str2: "pay"))
    
    print("**FALSE = ",  isOneAway(str1: "pales", str2: "pane") )
    print("**TRUE = ",  isOneAway(str1: "pal", str2: "pale") )
    print("**TRUE = ",  isOneAway(str1: "pale", str2: "pane") )
    print("**FALSE = ", isOneAway(str1: "pale", str2: "bake") )
    print("**FALSE = ", isOneAway(str1: "aaab", str2: "aaba") )
    print("**FALSE = ",  isOneAway(str1: "pales", str2: "paned") )
    print("**TRUE = ", isOneAway(str1: "aaab", str2: "aaaa") )
    print("**TRUE = ", isOneAway(str1: "aaab", str2: "aaa") )
    print("**TRUE = ", isOneAway(str1: "aaab", str2: "aab") )
    
}

//
// 1.6 Compress String
//
//

func compress(_ str: String ) -> String {
    let input = Array(str)
    var output = input + input // max double the length since worst case each letter is unique
    var j = 0
    var count = 1
    // first letter is same
    for i in 1 ..< input.count {
        // repeated letter
        if ( input[i] == input[i - 1] ) {
            // repeat
            count += 1
        } else {
            // new letter
            // setting previous letter count
            j += 1
            output[j] = Character((UnicodeScalar(count))!)
            // reset count
            count = 1
            // set new letter in output
            j += 1
            output[j] = input[i]
        }
        //        print(input[i], count)
    }
    j += 1
    output[j] = Character((UnicodeScalar(count))!)
    //print(input, output[0...j])
    
    return (j < str.count ) ? String(output[0...j]) : str
}

func compress2(_ str: String) -> String {
    
    var output = ""
    var count = 0
    var lastChar = 0
    
    for i in 0..<str.count {
        if (str[i] == str[lastChar]) {
            count += 1
        } else {
            output += String(str[lastChar]) + (count > 1 ? String(count) : "")
            lastChar = i
            count = 1
        }
    }
    // Append last Character
    output += String(str[lastChar]) + (count > 1 ? String(count) : "")
    return output
}

func compress3(_ str: String) -> String {
    
    var output = ""
    var count = 0
    
    for i in 0..<str.count - 1 {
        count += 1
        if (i + 1 > str.count || str[i] != str[i + 1]) {
            output += String(str[i]) + (count > 1 ? String(count) : "")
            count = 0
        }
    }
    // Append last Character
    return output.count < str.count ? output : str
}

func compress4(_ str: String) -> String {
    
    var output = ""
    var count = 0
    
    for i in 0..<str.count - 1 {
        count += 1
        if (i + 1 > str.count || str[i] != str[i + 1]) {
            output += "\((str[i]))\(count > 1 ? String(count) : "")"
            count = 0
        }
    }
    // Append last Character
    return output.count < str.count ? output : str
}

func prettyPrint(_ image: [[Int]]) {
    print("**********")
    for i in 0..<image.count {
        print(image[i])
    }
    
}

func rotate(_ image: [[Int]]) -> [[Int]] {
    
    
    var rotated = image
    let N = image.count
    assert((image.count == image[0].count))
    
    for i in 0..<N {
        for j in 0..<N {
            rotated[i][j] = image[ N - 1 - j ][i]
        }
    }
    prettyPrint(image)
    prettyPrint(rotated)
    
    return rotated
}

func testRotate() {
    
    let matrixSize = 5
    var intArray:[[Int]] = Array(repeating: Array(repeating: 0, count: matrixSize), count: matrixSize)
    
    for x in 0..<matrixSize {
        for y in 0..<matrixSize {
            intArray[x][y] = x * matrixSize + y
        }
    }
    
    _ = rotate(intArray)
}
