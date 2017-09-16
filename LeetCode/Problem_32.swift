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
    
    class Stack<T> {
        
        var items: [T]
        
        var count: Int {
            return items.count
        }
        
        init() {
            items = []
        }
        
        func push(_ item: T) {
            items.append(item)
        }
        
        func pop() -> T? {
            return count > 0 ? items.removeLast() : nil
        }
        
    }
    
    enum PB: Character {
        case left = "("
        case right = ")"
    }
    
    typealias IndexP = (index: Int, pb: PB)
    
    func longestValidParentheses(_ s: String) -> Int {
        let characters = Array(s.characters)
        
        let leftStack = Stack<IndexP>()
        let pairedStack = Stack<IndexP>()
        
        var i = 0
        while i < characters.count {
            let character = characters[i]
            
            guard let pb = PB(rawValue: character) else {
                fatalError()
            }
            
            switch pb {
            case .left:
                leftStack.push((i, pb))
            case .right:
                if leftStack.count > 0 {
                    let left = leftStack.pop()!
                    pairedStack.push(left)
                    pairedStack.push((i, pb))
                }
            }
            
            i += 1
        }
        
        return findLongestParentheses(stack: pairedStack)
    }
    
    private func findLongestParentheses(stack: Stack<IndexP>) -> Int {
        let indexs = stack.items.map { $0.index }.sorted()

        var i = 1
        var count = 1
        var maxContinuous = 0
        
        while i < indexs.count {
            let previous = indexs[i - 1]
            let current = indexs[i]
            
            if (current == previous + 1) {
                count += 1
            } else {
                count = 1
            }
            
            maxContinuous = (maxContinuous > count) ? maxContinuous : count
            
            i += 1
        }
        
        return maxContinuous
    }
    
}
