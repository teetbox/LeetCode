//
//  Problem_17.swift
//  LeetCode
//
//  Created by Tong Tian on 7/10/17.
//  Copyright © 2017 Bizersoft. All rights reserved.
//

import Foundation

// Letter Combinations of a Phone Number

/*
 Given a digit string, return all possible letter combinations that the number could represent.
 
 A mapping of digit to letters (just like on the telephone buttons) is given below.
 
 2:abc, 3:edf, 4:ghi, 5:jkl, 6:mno, 7:pqrs, 8: tuv, 9: wxyz
 
 Input:Digit string "23"
 Output: ["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"].
 
 Note:
 Although the above answer is in lexicographical order, your answer could be in any order you want.
 */

class Solution_17 {
    
    let two = ["a", "b", "c"]
    let three = ["d", "e", "f"]
    let four = ["g", "h", "i"]
    let five = ["j", "k", "l"]
    let six = ["m", "n", "o"]
    let seven = ["p", "q", "r", "s"]
    let eight = ["t", "u", "v"]
    let nine = ["w", "x", "y", "z"]
    
    func letterCombinations(_ digits: String) -> [String] {
        let numbers = Array(digits.characters)
        
        var letters = [[String]]()
        
        for number in numbers {
            switch number {
            case "2":
                letters.append(two)
            case "3":
                letters.append(three)
            case "4":
                letters.append(four)
            case "5":
                letters.append(five)
            case "6":
                letters.append(six)
            case "7":
                letters.append(seven)
            case "8":
                letters.append(eight)
            case "9":
                letters.append(nine)
            default:
                continue
            }
        }
        
        var combinations = [String]()
        
        guard letters.count > 0 else { return combinations }
        
        let initialCombinations = letters[0]
        letters.remove(at: 0)
        
        combinations = combinate(originalCombinations: initialCombinations, letters: letters)
        
        return combinations
    }
    
    private func combinate(originalCombinations: [String], letters: [[String]]) -> [String] {
        guard letters.count > 0 else {
            return originalCombinations
        }
        
        var leftLetters = letters
        
        var combinedString = [String]()
        
        for s1 in originalCombinations {
            for s2 in leftLetters[0] {
                combinedString.append(s1 + s2)
            }
        }
        
        leftLetters.remove(at: 0)
        
        return combinate(originalCombinations: combinedString, letters: leftLetters)
    }
    
}
