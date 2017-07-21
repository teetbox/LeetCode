//
//  TwoSum.swift
//  LeetCode
//
//  Created by Tong Tian on 7/1/17.
//  Copyright © 2017 Bizersoft. All rights reserved.
//

import Foundation

// Two Sum

/*
 Given an array of integers, return indices of the two numbers such that they add up to a specific target.
 You may assume that each input would have exactly one solution, and you may not use the same element twice.
 
 Example:
 Given nums = [2, 7, 11, 15], target = 9,
 Because nums[0] + nums[1] = 2 + 7 = 9,
 return [0, 1].
*/

class Solution_1 {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dic = [Int: Int]()
        
        for (index, value) in nums.enumerated() {
            if let previousIndex = dic[target - value] {
                return [previousIndex, index]
            }
            
            dic[value] = index
        }
        
        fatalError("No matched items!")
    }
}
