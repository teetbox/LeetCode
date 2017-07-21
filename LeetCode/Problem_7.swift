//
//  Problem_7.swift
//  LeetCode
//
//  Created by Tong Tian on 7/4/17.
//  Copyright © 2017 Bizersoft. All rights reserved.
//

import Foundation

// Reverse Integer

/*
 Reverse digits of an integer.
 
 Example1: x = 123, return 321
 Example2: x = -123, return -321
 */

class Solution_7 {
    func reverse(_ x: Int) -> Int {
        let reversedNumberStringArray = String(abs(x)).characters.reversed()
        let reversedNumber = Int(String(reversedNumberStringArray))!
        
        if reversedNumber >= Int(Int32.max) {
            return 0
        }
        
        return x > 0 ? reversedNumber : -reversedNumber
    }
}
