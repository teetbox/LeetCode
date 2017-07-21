//
//  Problem_16.swift
//  LeetCode
//
//  Created by Tong Tian on 7/9/17.
//  Copyright © 2017 Bizersoft. All rights reserved.
//

import Foundation

// 3Sum Closest

/*
 Given an array S of n integers, find three integers in S such that the sum is closest to a given number, target. Return the sum of the three integers. You may assume that each input would have exactly one solution.
 
 For example, given array S = {-1 2 1 -4}, and target = 1.
 
 The sum that is closest to the target is 2. (-1 + 2 + 1 = 2).
*/

class Solution_16 {
    
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        let sortedNums = nums.sorted()
        let count = nums.count
        
        guard count > 2 else { fatalError("Less than 3 items in nums.") }
        
        var threeSum = nums[0] + nums[1] + nums[2]
        var gap = abs(target - threeSum)
        
        for i in 0 ..< count - 2 {
            var start = i + 1
            var end = count - 1
            
            while start < end {
                let _threeSum = sortedNums[i] + sortedNums[start] + sortedNums[end]
                let _gap = target - _threeSum
                
                if _gap == 0 {
                    return _threeSum
                } else if abs(_gap) < gap {
                    threeSum = _threeSum
                    gap = abs(_gap)
                }
                
                if _threeSum > target {
                    end -= 1
                } else {
                    start += 1
                }
            }
        }
        
        return threeSum
    }
    
}
