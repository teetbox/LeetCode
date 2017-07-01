//
//  TwoSum.swift
//  LeetCode
//
//  Created by Matt Tian on 7/1/17.
//  Copyright © 2017 Bizersoft. All rights reserved.
//

import Foundation

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
