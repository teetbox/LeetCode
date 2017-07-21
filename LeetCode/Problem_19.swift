//
//  Problem_19.swift
//  LeetCode
//
//  Created by Tong Tian on 7/13/17.
//  Copyright © 2017 Bizersoft. All rights reserved.
//

import Foundation

// Remove Nth Node From End of List

/*
 Given a linked list, remove the nth node from the end of list and return its head.
 
 For example,
 
 Given linked list: 1->2->3->4->5, and n = 2.
 
 After removing the second node from the end, the linked list becomes 1->2->3->5.
 Note:
 Given n will always be valid.
 Try to do this in one pass.
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

class Solution_19 {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        guard head != nil else { return nil }
        
        if head?.next == nil {
            return nil
        }
        
        var nodes = [ListNode]()
        
        var node = head
        repeat {
            nodes.append(node!)
            node = node?.next
        } while node != nil
        
        let count = nodes.count
        
        switch n {
        case 1:
            nodes[count - 2].next = nil
        case 2..<count:
            nodes[count - n - 1].next = nodes[count - n + 1]
        case count:
            nodes.remove(at: 0)
        default:
            break
        }
        
        return nodes[0]
    }
    
}










