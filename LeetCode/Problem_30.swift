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
        
        let uniqueWords = words
        let wordLength = uniqueWords[0].characters.count
        
        let word = words[0]
        let letters = Set(Array(word.characters))
        
        var startIndex = 0
        var indexs: [Int] = []
        while startIndex <= s.characters.count - wordLength {
            let success = findSubstring(s, startIndex: startIndex, length: wordLength, words: uniqueWords)
            
            if (success) {
                indexs.append(startIndex)
                if letters.count > 1 {
                    startIndex += wordLength
                } else {
                    startIndex += 1
                }
            } else {
                startIndex += 1
            }
        }
        
        return indexs
    }
    
    private func findSubstring(_ s: String, startIndex: Int, length: Int, words: [String]) -> Bool {
        if words.count == 0 {
            return true
        }
        
        var _words = words
        var _startIndex = startIndex
        if let word = substring(s, location: startIndex, length: length) {
            if _words.contains(word) {
                let index = _words.index(of: word)
                _words.remove(at: index!)
                _startIndex += length
                return findSubstring(s, startIndex: _startIndex, length: length, words: _words)
            }
        }
        
        return false
    }
    
    private func substring(_ s: String, location: Int, length: Int) -> String? {
        guard s.characters.count >= location + length else {
            return nil
        }
        let start = s.index(s.startIndex, offsetBy: location)
        let end = s.index(s.startIndex, offsetBy: location + length)
        
        return s.substring(with: start..<end)
    }
    
}
