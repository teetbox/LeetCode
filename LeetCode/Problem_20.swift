//
//  Problem_20.swift
//  LeetCode
//
//  Created by Matt Tian on 7/14/17.
//  Copyright © 2017 Bizersoft. All rights reserved.
//

import Foundation

// Valid Parentheses

/*
 Given a string containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.
 
 The brackets must close in the correct order, "()" and "()[]{}" are all valid but "(]" and "([)]" are not.
*/

struct Stack<T> {
    var elements = [T]()
    
    mutating func push(_ element: T) {
        elements.append(element)
    }
    
    mutating func pop() {
        _ = elements.popLast()
    }
    
    func topElement() -> T? {
        return elements.last
    }
}

class Solution_20 {
    
    func isValid(_ s: String) -> Bool {
        var stack = Stack<String>()
        
        let characters = Array(s.characters)
        
        var i = 0
        
        while i < characters.count {
            let current = String(characters[i])
            
            if let top = stack.topElement() {
                
                if (top == "(" && current == ")") || (top == "[" && current == "]") || (top == "{" && current == "}") {
                    stack.pop()
                } else {
                    stack.push(current)
                }
            } else {
                stack.push(current)
            }
            
            i += 1
        }
        
        return stack.elements.count == 0
    }
    
    enum Parenthesis: String {
        case left = "("
        case right = ")"
    }
    
    enum SquareBracket: String {
        case left = "["
        case right = "]"
    }
    
    enum Brace: String {
        case left = "{"
        case right = "}"
    }
    
    enum Symbol: String {
        case parenthesis = "("
        case squareBracket = "["
        case brace = "{"
    }
    
    // func isValid_2 is for "()[]{}" this kind of string
    func isValid_2(_ s: String) -> Bool {
        let characters = Array(s.characters)
        
        let count = characters.count
        
        if count == 0 || count == 1 {
            return false
        }
        
        var i = 0
        while i < count - 1 {
            let character = characters[i]
            
            guard let symbol = Symbol(rawValue: String(character)) else {
                return false
            }
            
            let nextSymbol = String(characters[i + 1])
            
            switch symbol {
            case .parenthesis:
                guard let rightParenthesis = Parenthesis(rawValue: nextSymbol) else {
                    return false
                }
                
                if rightParenthesis == Parenthesis.right {
                    i += 2
                } else {
                    return false
                }
                
            case .squareBracket:
                guard let rightSquareBracket = SquareBracket(rawValue: nextSymbol) else {
                    return false
                }
                
                if rightSquareBracket == SquareBracket.right {
                    i += 2
                } else {
                    return false
                }
                
            case .brace:
                guard let rightBrace = Brace(rawValue: nextSymbol) else {
                    return false
                }
                
                if rightBrace == Brace.right {
                    i += 2
                } else {
                    return false
                }
            }
        }
        
        return true
    }
    
}
