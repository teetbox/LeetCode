//
//  Problem_21.swift
//  LeetCode
//
//  Created by Tong Tian on 7/15/17.
//  Copyright © 2017 Bizersoft. All rights reserved.
//

import Foundation

// Merge Two Sorted Lists

/*
 Merge two sorted linked lists and return it as a new list. The new list should be made by splicing together the nodes of the first two lists.
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

class Solution_21 {
    
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil {
            return l2
        }
        
        if l2 == nil {
            return l1
        }
        
        if l1!.val < l2!.val {
            l1!.next = mergeTwoLists(l1!.next, l2)
            return l1
        } else {
            l2!.next = mergeTwoLists(l1, l2!.next)
            return l2
        }
    }


    func mergeTwoLists_My(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var node: ListNode? = nil
        var nodes = [ListNode?]()
        
        var node1 = l1
        var node2 = l2
        while node1 != nil || node2 != nil {
            let value1 = node1?.val
            let value2 = node2?.val
            
            if let v1 = value1, let v2 = value2 {
                if v1 < v2 {
                    node = node1
                    node1 = node1?.next
                } else {
                    node = node2
                    node2 = node2?.next
                }
                nodes.append(node)
                node = node?.next
            } else if value1 != nil {
                node = node1
                nodes.append(node)
                node1 = node1?.next
            } else if value2 != nil {
                node = node2
                nodes.append(node)
                node2 = node2?.next
            }
        }
        
        var i = 0
        while i < nodes.count - 1 {
            nodes[i]?.next = nodes[i + 1]
            i += 1
        }
        
        return nodes.isEmpty ? nil : nodes.first!
    }
    
    func mergeTwoLists_TLE(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        
        var nodes = [ListNode]()
        
        if let node1 = l1 {
            var node: ListNode? = node1
            repeat {
                nodes.append(node!)
                node = node?.next
            } while node != nil
        }
        
        if let node2 = l2 {
            var node: ListNode? = node2
            repeat {
                nodes.append(node!)
                node = node?.next
            } while node != nil
        }
        
        let sortedNodes = nodes.sorted { $0.val < $1.val }
        
        if sortedNodes.isEmpty {
            return nil
        }
        
        var i = 0
        while i < sortedNodes.count - 1 {
            sortedNodes[i].next = sortedNodes[i + 1]
            i += 1
        }
        
        return sortedNodes.isEmpty ? nil : sortedNodes[0]
    }
    
}








