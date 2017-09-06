//
//  Problem_30.swift
//  LeetCode
//
//  Created by Tong Tian on 31/07/2017.
//  Copyright © 2017 Bizersoft. All rights reserved.
//

import Foundation

// Substring with Concatenation of All Words

/*
 You are given a string, s, and a list of words, words, that are all of the same length. Find all starting indices of substring(s) in s that is a concatenation of each word in words exactly once and without any intervening characters.
 
 For example, given:
 s: "barfoothefoobarman"
 words: ["foo", "bar"]
 
 You should return the indices: [0,9].
 (order does not matter).
 */

class Solution_30 {
    
    func findSubstring(_ s: String, _ words: [String]) -> [Int] {
        guard words.count > 0 else { fatalError("Empty words") }
        
        let uniqueWords = Array(Set(words))
        let wordLength = uniqueWords[0].count
        
        print(uniqueWords.count)
        print(wordLength)
        
        return []
    }
    
}

























