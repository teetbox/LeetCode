//
//  Problem_33.swift
//  LeetCode
//
//  Created by Tong Tian on 17/09/2017.
//  Copyright © 2017 Bizersoft. All rights reserved.
//

import Foundation

// Search in Rotated Sorted Array

/*
 Suppose an array sorted in ascending order is rotated at some pivot unknown to you beforehand.
 
 (i.e., 0 1 2 4 5 6 7 might become 4 5 6 7 0 1 2).
 
 You are given a target value to search. If found in the array return its index, otherwise return -1.
 
 You may assume no duplicate exists in the array.
 */

class Solution_33 {
    
    func search(_ nums: [Int], _ target: Int) -> Int {
        guard let index = nums.index(of: target) else {
            return -1
        }
        
        return index
    }
    
}
