//
//  Problem_35.swift
//  LeetCode
//
//  Created by Tong Tian on 23/09/2017.
//  Copyright © 2017 Bizersoft. All rights reserved.
//

import Foundation

// Search Insert Position

/*
 Given a sorted array and a target value, return the index if the target is found. If not, return the index where it would be if it were inserted in order.
 
 You may assume no duplicates in the array.
 
 Here are few examples.
 [1,3,5,6], 5 → 2
 [1,3,5,6], 2 → 1
 [1,3,5,6], 7 → 4
 [1,3,5,6], 0 → 0
 */

class Solution_35 {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        let left = binarySearchForLeftSide(nums, target)
        
        if nums[left] >= target {
            return left
        } else {
            return left + 1
        }
    }
    
    func binarySearchForLeftSide(_ nums: [Int], _ target: Int) -> Int {
        var left = 0
        var right = nums.count
        var middle = 0
        
        while left < right {
            middle = (left + right) / 2
            let num = nums[middle]
            if (num == target) {
                return middle
            } else if (nums[middle] < target) {
                guard left != middle else { return left }
                left = middle
            } else {
                guard right != middle else { return left }
                right = middle
            }
        }
        
        return left
    }
    
}
