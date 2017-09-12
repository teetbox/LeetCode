//
//  Problem_32.swift
//  LeetCode
//
//  Created by Tong Tian on 12/09/2017.
//  Copyright © 2017 Bizersoft. All rights reserved.
//

import Foundation

// Longest Valid Parentheses

/*
 Given a string containing just the characters '(' and ')', find the length of the longest valid (well-formed) parentheses substring.
 
 For "(()", the longest valid parentheses substring is "()", which has length = 2.
 
 Another example is ")()())", where the longest valid parentheses substring is "()()", which has length = 4.
 */

class Solution_32 {
    enum PP: Character {
        case left = "("
        case right = ")"
    }
    
    func longestValidParentheses(_ s: String) -> Int {
        let p = Array(s.characters)
        
        guard p.count != 0 else { return 0 }
        
        var maxCount = 0
        
        var i = 0
        var stack = Stack<Character>()
        while i < p.count {
            let startIndex = i
            guard let pp = PP(rawValue: p[i]) else {
                fatalError("Unexpected Character")
            }
            switch pp {
            case .left:
                i += 1
                stack.push(pp.rawValue)
                continue
            case .right:
                if let previousPP = stack.topElement() {
                    if previousPP == PP.left.rawValue {
                        i += 1
                        continue
                    } else {
                        stack.pop()
                    }
                }
                i += 1
            }
        }
        
        return 0
    }
    
    private func pairPP(_ pp: [Character], index: Int, stack: Stack<Character>) -> Int {
        
        return 0
    }
}























