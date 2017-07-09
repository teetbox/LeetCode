//
//  Problem_15.swift
//  LeetCode
//
//  Created by Matt Tian on 7/8/17.
//  Copyright © 2017 Bizersoft. All rights reserved.
//

import Foundation

// 3Sum

/*
 Given an array S of n integers, are there elements a, b, c in S such that a + b + c = 0? Find all unique triplets in the array which gives the sum of zero.
 
 Note: The solution set must not contain duplicate triplets.
 
 For example, given array S = [-1, 0, 1, 2, -1, -4],
 
 A solution set is:
 [[-1, 0, 1], [-1, -1, 2]]
*/

class Solution_15 {
    
    func threeSum(_ nums: [Int]) -> [[Int]] {
        let sortedNums = nums.sorted()
        let count = nums.count
        
        var triplets = [[Int]]()
        
        var i = 0
        while i < count - 2 {
            let one = sortedNums[i]
            
            var start = i + 1
            var end = count - 1
            
            while start < end {
                let two = sortedNums[start]
                let three = sortedNums[end]
                let sum = one + two + three
                
                if sum == 0 {
                    triplets.append([one, two, three])
                    
                    start += 1
                    end -= 1
                    
                    while start < end && sortedNums[start] == two {
                        start += 1
                    }
                    
                    while end > start && sortedNums[end] == three {
                        end -= 1
                    }
                } else if sum < 0 {
                    start += 1
                } else {
                    end -= 1
                }
            }
            
            i += 1
            
            while i < count - 1 && sortedNums[i] == one {
                i += 1
            }
        }
        
        return triplets
    }
    
    func threeSum_TLE(_ nums: [Int]) -> [[Int]] {
        let positives = nums.filter { $0 > 0 }
        let negatives = nums.filter { $0 < 0 }
        
        var threeNumbersWithZero = [[Int]]()
        var threeNumbersWithoutZero = [[Int]]()
        var twoNumbers = [[Int]]()
        
        if nums.contains(0) {
            twoNumbers = findTwoNumbers(positives: positives, negatives: negatives)
            
            for twoNumber in twoNumbers {
                threeNumbersWithZero.append(twoNumber + [0])
            }
            
            // three zero
            let zeros = nums.filter { $0 == 0 }
            if zeros.count >= 3 {
                threeNumbersWithZero.append([0, 0, 0])
            }
        }
        
        threeNumbersWithoutZero = findThreeNumbers(positives: positives, negatives: negatives)
        
        return threeNumbersWithZero + threeNumbersWithoutZero
    }
    
    private func findTwoNumbers(positives: [Int], negatives: [Int]) -> [[Int]] {
        var twoNumbers = [[Int]]()
        var foundNumbers = [Int]()
        
        for number in positives {
            if negatives.contains(-number) {
                if !foundNumbers.contains(number) {
                    foundNumbers.append(number)
                    twoNumbers.append([number, -number])
                }
            }
        }
        
        return twoNumbers
    }
    
    private func findThreeNumbers(positives: [Int], negatives: [Int]) -> [[Int]] {
        var threeNumbers = [[Int]]()

        // a1 + b1 + b2 = 0
        func oneMatchTwo(arrayA: [Int], arrayB: [Int]) -> [[Int]] {
            var matchs = [[Int]]()
            var foundANumbers = [Int]()
            
            for a1 in arrayA {
                if !foundANumbers.contains(a1) {
                    foundANumbers.append(a1)
                    
                    var foundBNumbers = [Int]()
                    
                    for b1 in arrayB {
                        let b2 = -(a1 + b1)
                        
                        var tempB = arrayB
                        tempB.remove(at: arrayB.index(of: b1)!)
                        
                        if tempB.contains(b2) {
                            if !foundBNumbers.contains(b2) {
                                foundBNumbers.append(contentsOf: [b1, b2])
                                matchs.append([a1, b1, b2])
                            }
                        }
                    }
                }
            }
            
            return matchs
        }
        
        threeNumbers += oneMatchTwo(arrayA: positives, arrayB: negatives)
        threeNumbers += oneMatchTwo(arrayA: negatives, arrayB: positives)
        
        return threeNumbers
    }
    
}
