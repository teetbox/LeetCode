//
//  Problem_5.swift
//  LeetCode
//
//  Created by Tong Tian on 7/2/17.
//  Copyright © 2017 Bizersoft. All rights reserved.
//

import Foundation

// Longest Palindromic Substring

/*
 Given a string s, find the longest palindromic substring in s. You may assume that the maximum length of s is 1000.
 
 Example:
 Input: "babad"
 Output: "bab"
 Note: "aba" is also a valid answer.
 
 Example:
 Input: "cbbd"
 Output: "bb"
*/

class Solution_5 {
    func longestPalindrome(_ s: String) -> String {
        let sArray = Array(s.characters)
        var start = 0
        var end = 0

        for centerIndex in 0 ..< sArray.count {
            let len1 = expendAroundCenter(array: sArray, centerLeft: centerIndex, centerRight: centerIndex)
            let len2 = expendAroundCenter(array: sArray, centerLeft: centerIndex, centerRight: centerIndex + 1)
            let len = max(len1, len2)
            
            if len > (end - start + 1) {
                start = (len == len1) ? (centerIndex - len / 2) : (centerIndex - len / 2 + 1)
                end = centerIndex + len / 2
            }
        }
        
        return String(sArray[start...end])
    }
    
    func expendAroundCenter(array: [Character], centerLeft: Int, centerRight: Int) -> Int {
        var left = centerLeft
        var right = centerRight
        
        while (left >= 0 && right < array.count && array[left] == array[right]) {
            left -= 1
            right += 1
        }
        
        return right - left - 1
    }
}
