//
//  Problem_11.swift
//  LeetCode
//
//  Created by Matt Tian on 7/6/17.
//  Copyright © 2017 Bizersoft. All rights reserved.
//

import Foundation

// Container With Most Water

/*
 Given n non-negative integers a1, a2, ..., an, where each represents a point at coordinate (i, ai). n vertical lines are drawn such that the two endpoints of line i is at (i, ai) and (i, 0). Find two lines, which together with x-axis forms a container, such that the container contains the most water.
 
 Note: You may not slant the container and n is at least 2.
*/

class Solution_11 {
    func maxArea(_ height: [Int]) -> Int {
        var maxArea = 0
        for (index, number) in height.enumerated() {
            for x in (index + 1)..<height.count {
                let area = (x - index) * min(number, height[x])
                maxArea = area > maxArea ? area : maxArea
            }
        }
        
        return maxArea
    }
    
    func maxAreaAdvanced(_ height: [Int]) -> Int {
        return computeMaxArea(height, p1: 0, p2: height.count - 1)
    }
    
    func computeMaxArea(_ numbers: [Int], p1: Int, p2: Int, maxArea: Int = 0) -> Int {
        guard p1 < p2 else { return maxArea }
        
        var indexA = p1
        var indexB = p2
        
        let area = min(numbers[indexA], numbers[indexB]) * (indexB - indexA)
        
        let _maxArea = area > maxArea ? area : maxArea
        
        if numbers[indexA] > numbers[indexB] {
            indexB -= 1
        } else {
            indexA += 1
        }
        
        return computeMaxArea(numbers, p1: indexA, p2: indexB, maxArea: _maxArea)
    }
    
}
