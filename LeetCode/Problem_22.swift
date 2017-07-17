//
//  Problem_22.swift
//  LeetCode
//
//  Created by Matt Tian on 7/16/17.
//  Copyright © 2017 Bizersoft. All rights reserved.
//

import Foundation

// Generate Parentheses

/*
 Given n pairs of parentheses, write a function to generate all combinations of well-formed parentheses.
 
 For example, given n = 3, a solution set is:
 
 [
 "((()))",
 "(()())",
 "(())()",
 "()(())",
 "()()()"
 ]
*/

class Solution_22 {
 
    func generateParenthesis(_ n: Int) -> [String] {
        guard n > 0 else { return [] }
        
        let initialCombined = [("(", 1, 0)]
        let results = combineParenthesis(combined: initialCombined, left: "(", right: ")", count: n * 2)
        
        return results.map { $0.0 }
    }
    
    private func combineParenthesis(combined: [(String, Int, Int)], left: String, right: String, count: Int) -> [(String, Int, Int)] {
        guard combined[0].0.characters.count < count else {
            return combined
        }
        
        let appendLeft = combined.map { ($0.0 + left, $0.1 + 1, $0.2) }
        let appendRight = combined.map { ($0.0 + right, $0.1, $0.2 + 1) }
        
        let combinedLeft = appendLeft.filter { $0.1 <= count / 2 && $0.1 >= $0.2 }
        let combinedRight = appendRight.filter { $0.1 >= $0.2 }
    
        return combineParenthesis(combined: combinedLeft + combinedRight, left: left, right: right, count: count)
    }
    
}
