//
//  Problem_9.swift
//  LeetCode
//
//  Created by Tong Tian on 7/5/17.
//  Copyright © 2017 Bizersoft. All rights reserved.
//

import Foundation

// Palindrome Number

/*
 Determine whether an integer is a palindrome. Do this without extra space.
*/

class Solution_9 {
    func isPalindrome(_ x: Int) -> Bool {
        guard x >= 0 else { return false }
        return String(x) == String(String(x).characters.reversed())
    }
}
