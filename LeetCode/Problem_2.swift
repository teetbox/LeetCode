//
//  AddTwoNumbers.swift
//  LeetCode
//
//  Created by Matt Tian on 7/1/17.
//  Copyright © 2017 Bizersoft. All rights reserved.
//

import Foundation

// Add Two Numbers

/*
 You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.
 You may assume the two numbers do not contain any leading zero, except the number 0 itself.
 
 Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
 Output: 7 -> 0 -> 8
*/

class ListNode {
    var val: Int
    var next: ListNode?
    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution_2 {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var firstValue = 0
        var secondValue = 0
        
        if l1 == nil && l2 == nil {
            return nil
        }
        if l1 != nil {
            firstValue = l1!.val
        }
        if l2 != nil {
            secondValue = l2!.val
        }
        
        let sum = firstValue + secondValue
        let node: ListNode
        if sum > 9 {
            let remainder = sum % 10
            node = ListNode(remainder)
            
            let nextNode: ListNode
            if let l1Next = l1?.next {
                nextNode = l1Next
                nextNode.val += 1
            } else {
                nextNode = ListNode(1)
            }
            
            node.next = addTwoNumbers(nextNode, l2?.next)
        } else {
            node = ListNode(sum)
            node.next = addTwoNumbers(l1?.next, l2?.next)
        }
        
        return node
    }
}
