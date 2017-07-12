//
//  Problem_18.swift
//  LeetCode
//
//  Created by Matt Tian on 7/12/17.
//  Copyright © 2017 Bizersoft. All rights reserved.
//

import Foundation

// 4Sum

/*
 Given an array S of n integers, are there elements a, b, c, and d in S such that a + b + c + d = target? Find all unique quadruplets in the array which gives the sum of target.
 
 Note: The solution set must not contain duplicate quadruplets.
 
 For example, given array S = [1, 0, -1, 0, -2, 2], and target = 0.
 
 A solution set is:
 [
    [-1,  0, 0, 1],
    [-2, -1, 1, 2],
    [-2,  0, 0, 2]
 ]
*/

class Solution_18 {
    
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        guard nums.count > 3 else { return [[Int]]() }
        
        let sortedNums = nums.sorted()
        
        var results = [[Int]]()
        
        var i = 0
        while i < sortedNums.count - 1 {
            let num = sortedNums[i]
            
            let numsForThreeSum = Array(sortedNums[(i + 1)...(sortedNums.count - 1)])
            
            if numsForThreeSum.count < 3 {
                break
            }
            
            let threeResults = threeSum(numsForThreeSum, target - num)
            let subResults = threeResults.map { [num] + $0 }
            
            results += subResults
            
            repeat {
                i += 1
            } while sortedNums[i] == sortedNums[i - 1] && i < sortedNums.count - 1
        }
        
        return results
    }
    
    private func threeSum(_ sortedNums: [Int], _ target: Int) -> [[Int]] {
        guard sortedNums.count > 2 else { fatalError("Less Than 3 Numbers.") }
        
        var results = [[Int]]()
        
        var i = 0
        while i < sortedNums.count - 2 {
            
            var start = i + 1
            var end = sortedNums.count - 1
            
            while start < end {
                
                let sum = sortedNums[i] + sortedNums[start] + sortedNums[end]
                
                if sum == target {
                    results.append([sortedNums[i], sortedNums[start], sortedNums[end]])
                    
                    repeat {
                        start += 1
                    } while sortedNums[start] == sortedNums[start - 1] && start < end
                    
                    repeat {
                        end -= 1
                    } while sortedNums[end] == sortedNums[end + 1] && start < end

                } else if sum < target {
                    start += 1
                } else {
                    end -= 1
                }
            }
            
            repeat {
                i += 1
            } while sortedNums[i] == sortedNums[i - 1] && i < sortedNums.count - 2
        }
        
        return results
    }
    
}
