//
//  Problem_28.swift
//  LeetCode
//
//  Created by Tong Tian on 7/22/17.
//  Copyright © 2017 Bizersoft. All rights reserved.
//

import Foundation

// Implement strStr()

/*
 Implement strStr().
 
 Returns the index of the first occurrence of needle in haystack, or -1 if needle is not part of haystack.
 */

class Solution_28 {
    func strStr_Advanced(_ haystack: String, _ needle: String) -> Int {
        let haysCount = haystack.characters.count
        let needleCount = needle.characters.count
        
        let gap = haysCount - needleCount
        
        if gap < 0 {
            return -1
        }
        
        for index in 0...gap {
            let start = haystack.index(haystack.startIndex, offsetBy: index)
            let end = haystack.index(start, offsetBy: needleCount)
            
//            let subString = haystack.substring(with: start..<end)
            // Swift 4
            let subString = String(haystack[start..<end])
            if subString == needle {
                return index
            }
        }
    
        return -1
    }
    
    func strStr(_ haystack: String, _ needle: String) -> Int {
        if needle.isEmpty && haystack.isEmpty {
            return 0
        } else if needle.isEmpty {
            return 0
        } else if haystack.isEmpty {
            return -1
        }
        
        if haystack.contains(needle) {
            let haysCharacters = Array(haystack.characters)
            let needleCharacters = Array(needle.characters)
            let haysCount = haysCharacters.count
            let needleCount = needleCharacters.count
            
            var index = 0
            while index < haysCount {
                let startIndex = index
                var _index = index
                var _count = 0
                while haysCharacters[_index] == needleCharacters[_count] {
                    if (_count + 1) == needleCount {
                        return startIndex
                    }
                    
                    _index += 1
                    _count += 1
                }
                index += 1
            }
        }

        return -1
    }
}
