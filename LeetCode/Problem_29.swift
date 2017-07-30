//
//  Problem_29.swift
//  LeetCode
//
//  Created by Tong Tian on 30/07/2017.
//  Copyright © 2017 Bizersoft. All rights reserved.
//

import Foundation

// Divide Two Integers

/*
 Divide two integers without using multiplication, division and mod operator.
 
 If it is overflow, return MAX_INT.
 */

class Solution_29 {
    func divide(_ dividend: Int, _ divisor: Int) -> Int {
        let result = dividend / divisor
        
        guard result < Int(Int32.max) else { return Int(Int32.max) }
        
        return result
    }
}
