//
//  Problem_34.swift
//  LeetCode
//
//  Created by Tong Tian on 9/22/17.
//  Copyright © 2017 Bizersoft. All rights reserved.
//

import Foundation

// Search for a Range

/*
 Given an array of integers sorted in ascending order, find the starting and ending position of a given target value.
 
 Your algorithm's runtime complexity must be in the order of O(log n).
 
 If the target is not found in the array, return [-1, -1].
 
 For example,
 Given [5, 7, 7, 8, 8, 10] and target value 8,
 return [3, 4].
 */

class Solution_34 {
    
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        var range = [-1, -1]
        
        if let index = nums.index(of: target) {
            range[0] = index
        }
        
        let reversedNums = nums.sorted { $0 > $1 }
        
        if let index = reversedNums.index(of: target) {
            range[1] = nums.count - 1 - index
        }
        
        return range
    }
    
    // [2,4,6,8] + 6 -> 2; [2,4,6,8] + 7 -> 2
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
