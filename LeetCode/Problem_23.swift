//
//  Problem_23.swift
//  LeetCode
//
//  Created by Matt Tian on 7/17/17.
//  Copyright © 2017 Bizersoft. All rights reserved.
//

import Foundation

// Merge k Sorted Lists

/*
 Merge k sorted linked lists and return it as one sorted list. Analyze and describe its complexity.
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

class Solution_23 {
    
    func mergeKLists_Advance(_ lists: [ListNode?]) -> ListNode? {
        guard lists.count > 0 else { return nil }
        
        var _lists = lists
        while _lists.count > 1 {
            let l1 = _lists.removeFirst()
            let l2 = _lists.removeFirst()
            
            _lists.append(mergeTwoLists(l1, l2))
        }
        
        return _lists[0]
    }
    
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
    
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        var values = [ListNode]()
        
        for list in lists {
            if let value = list?.val {
                values.append(ListNode(value))
                
                var _list = list
                while _list?.next != nil {
                    values.append(ListNode(_list!.next!.val))
                    _list = _list?.next
                }
            }
        }
        
        let sortedValue = values.sorted { $0.val < $1.val }
        
        if sortedValue.count == 0 {
            return nil
        }
        
        if sortedValue.count == 1 {
            return sortedValue[0]
        }
        
        var i = 0
        while i < sortedValue.count - 1 {
            sortedValue[i].next = sortedValue[i + 1]
            i += 1
        }
        
        return sortedValue[0]
    }
    
    func mergeKLists_TLE(_ lists: [ListNode?]) -> ListNode? {
        let nodes = lists.flatMap { $0 }.sorted { $0.val < $1.val }
        
        let count = nodes.count
        
        guard count > 0 else { return nil }
        
        var leftNodes = [ListNode?]()
        
        for (index, node) in nodes.enumerated() {
            if index == 0 {
                leftNodes.append(node.next)
            } else {
                leftNodes.append(node)
            }
        }
        
        nodes[0].next = mergeKLists(leftNodes)
        
        return nodes[0]
    }
    
}
