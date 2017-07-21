//
//  Problem_14.swift
//  LeetCode
//
//  Created by Tong Tian on 7/7/17.
//  Copyright © 2017 Bizersoft. All rights reserved.
//

import Foundation

// Longest Common Prefix

/*
 Write a function to find the longest common prefix string amongst an array of strings.
*/

class Solution_14 {
    
    func longestCommonPrefix(_ strs: [String]) -> String {
        return strs.isEmpty ? "" : findLongestCommonPrefix(strs, index: 0, prefix: strs[0])
    }
    
    private func findLongestCommonPrefix(_ strs: [String], index: Int, prefix: String) -> String {
        guard index < strs.count else { return prefix }
        
        let str = strs[index]

        var _prefix = str.hasPrefix(prefix) ? oneMorePrefix(str, prefix: prefix) : oneLessPrefix(str, prefix: prefix)
        
        _prefix = prefix.characters.count < _prefix.characters.count ? prefix : _prefix
        
        return findLongestCommonPrefix(strs, index: index + 1, prefix: _prefix)
    }
    
    private func oneMorePrefix(_ string: String, prefix: String) -> String {
        guard prefix.endIndex < string.endIndex else { return prefix }
        
        let index = string.index(prefix.endIndex, offsetBy: 2)
        let _prefix = string.substring(to: index)
        
        return string.hasPrefix(_prefix) ? oneMorePrefix(string, prefix: _prefix) : prefix
    }
    
    private func oneLessPrefix(_ string: String, prefix: String) -> String {
        guard !prefix.isEmpty else { return prefix }
        
        let _prefix = String(prefix.characters.dropLast())
        
        return string.hasPrefix(_prefix) ? _prefix : oneLessPrefix(string, prefix: _prefix)
    }
    
}
