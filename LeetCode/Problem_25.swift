//
//  Problem_25.swift
//  LeetCode
//
//  Created by Tong Tian on 7/19/17.
//  Copyright © 2017 Bizersoft. All rights reserved.
//

import Foundation

// Reverse Nodes in k-Group

/*
 Given a linked list, reverse the nodes of a linked list k at a time and return its modified list.
 
 k is a positive integer and is less than or equal to the length of the linked list. If the number of nodes is not a multiple of k then left-out nodes in the end should remain as it is.
 
 You may not alter the values in the nodes, only nodes itself may be changed.
 
 Only constant memory is allowed.
 
 For example,
 Given this linked list: 1->2->3->4->5
 
 For k = 2, you should return: 2->1->4->3->5
 
 For k = 3, you should return: 3->2->1->4->5
*/

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

class Solution_25 {
    
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        guard k > 0 && head != nil else { return head }
        
        var arrays = Array(repeating: [ListNode](), count: k)
        
        var i = 0
        var node = head
        while node != nil {
            let remainder = i % k
            arrays[remainder].append(node!)
            i += 1
            node = node?.next
        }
        
        // arrarys = [[0,3,6,9],
        //            [1,4,7,10],
        //            [2,5,8]]
    
        if arrays[k - 1].isEmpty {
            return head
        }
        
        for (index, node) in arrays[k - 1].enumerated() {
            var remainder = k - 1
            
            var nextNode: ListNode?
            if index < arrays[k - 1].count - 1 {
                nextNode = arrays[k - 1][index + 1]
            } else {
                nextNode = node.next
            }
            
            while remainder > 0 {
                arrays[remainder][index].next = arrays[remainder - 1][index]
                remainder -= 1
            }
            
            arrays[0][index].next = nextNode
        }
        
        return arrays[k - 1][0]
    }
    
}



















