//
//  Problem_3.swift
//  LeetCode
//
//  Created by Tong Tian on 7/1/17.
//  Copyright © 2017 Bizersoft. All rights reserved.
//

import Foundation

// Longest Substring Without Repeating Characters

/*
 Given a string, find the length of the longest substring without repeating characters.
 
 Examples:
 Given "abcabcbb", the answer is "abc", which the length is 3.
 Given "bbbbb", the answer is "b", with the length of 1.
 Given "pwwkew", the answer is "wke", with the length of 3. Note that the answer must be a substring, "pwke" is a subsequence and not a substring.
*/

class Solution_3 {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var substring = ""
        var maxSubstring = ""
        
        for letter in s.characters {
            if substring.characters.contains(letter) {
                let index = substring.characters.index(of: letter)!
                let nextIndex = substring.index(after: index)
//                substring = substring.substring(from: nextIndex)
                // Swift 4
                substring = String(substring[nextIndex...])
            }
            
            substring += String(letter)
            maxSubstring = (substring.characters.count > maxSubstring.characters.count) ? substring : maxSubstring
        }
        
        return maxSubstring.characters.count
    }
}
