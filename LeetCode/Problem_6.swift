//
//  Problem_6.swift
//  LeetCode
//
//  Created by Tong Tian on 7/3/17.
//  Copyright © 2017 Bizersoft. All rights reserved.
//

import Foundation

// ZigZag Conversion

/*
 The string "PAYPALISHIRING" is written in a zigzag pattern on a given number of rows like this: (you may want to display this pattern in a fixed font for better legibility)
 
 P   A   H   N
 A P L S I I G
 Y   I   R
 And then read line by line: "PAHNAPLSIIGYIR"
 Write the code that will take a string and make this conversion given a number of rows:
 
 0| A       I       Q
 1| B     H J     P
 2| C   G   K   O
 3| D F     L N
 4| E       M
 
 string convert(string text, int nRows);
 convert("PAYPALISHIRING", 3) should return "PAHNAPLSIIGYIR".
*/

class Solution_6 {
    func convert(_ s: String, _ numRows: Int) -> String {
        if numRows == 1 {
            return s
        }
        
        let perZigzagItemsCount = numRows * 2 - 2
        var stringRows = [String](repeating: "", count: numRows)
        
        for (index, character) in s.characters.enumerated() {
            let remainder = index % perZigzagItemsCount
            if remainder < numRows {
                stringRows[remainder].append(character)
            } else {
                stringRows[perZigzagItemsCount - remainder].append(character)
            }
        }
        
        return stringRows.reduce("") { $0 + $1 }
    }
}
