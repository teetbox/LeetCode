//
//  Problem_24.swift
//  LeetCode
//
//  Created by Matt Tian on 7/18/17.
//  Copyright © 2017 Bizersoft. All rights reserved.
//

import Foundation

// Swap Nodes in Pairs

/*
 Given a linked list, swap every two adjacent nodes and return its head.
 
 For example,
 Given 1->2->3->4, you should return the list as 2->1->4->3.
 
 Your algorithm should use only constant space. You may not modify the values in the list, only nodes itself can be changed.
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
class Solution_24 {
    func swapPairs(_ head: ListNode?) -> ListNode? {
        
        var evenNodes = [ListNode]()
        var oddNodes = [ListNode]()
        
        var i = 0
        var node = head
        while node != nil {
            if i % 2 == 0 {
                evenNodes.append(node!)
            } else {
                oddNodes.append(node!)
            }
            i += 1
            node = node?.next
        }
        
        guard oddNodes.count > 0 else {
            return head
        }
        
        for (index, node) in oddNodes.enumerated() {
            node.next = evenNodes[index]
            if index < oddNodes.count - 1 {
                evenNodes[index].next = oddNodes[index + 1]
            } else {
                evenNodes[index].next = nil
            }
        }
        
        if evenNodes.count > oddNodes.count {
            evenNodes[evenNodes.count - 2].next = evenNodes[evenNodes.count - 1]
        }
        
        return oddNodes[0]
    }
    
}
















