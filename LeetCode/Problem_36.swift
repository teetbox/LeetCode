//
//  Problem_36.swift
//  LeetCode
//
//  Created by Tong Tian on 9/25/17.
//  Copyright © 2017 Bizersoft. All rights reserved.
//

import Foundation

// Valid Sudoku

/*
 Determine if a Sudoku is valid, according to: Sudoku Puzzles - The Rules.
 
 The Sudoku board could be partially filled, where empty cells are filled with the character '.'.
 A partially filled sudoku which is valid.
 
 ["53..7....","6..195...",".98....6.","8...6...3","4..8.3..1","7...2...6",".6....28.","...419..5","....8..79"]
 
 Note:
 A valid Sudoku board (partially filled) is not necessarily solvable. Only the filled cells need to be validated.
 */

class Solution_36 {
    func isValidSudoku(_ boards: [String]) -> Bool {
        var board = [[Character]]()
        
        for str in boards {
            board.append(Array(str.characters))
        }
        
        var r1 = [Character](),
        r2 = [Character](),
        r3 = [Character](),
        r4 = [Character](),
        r5 = [Character](),
        r6 = [Character](),
        r7 = [Character](),
        r8 = [Character](),
        r9 = [Character](),
        c1 = [Character](),
        c2 = [Character](),
        c3 = [Character](),
        c4 = [Character](),
        c5 = [Character](),
        c6 = [Character](),
        c7 = [Character](),
        c8 = [Character](),
        c9 = [Character]()
        
        r1 = board[0].filter { $0 != "." }
        r2 = board[1].filter { $0 != "." }
        r3 = board[2].filter { $0 != "." }
        r4 = board[3].filter { $0 != "." }
        r5 = board[4].filter { $0 != "." }
        r6 = board[5].filter { $0 != "." }
        r7 = board[6].filter { $0 != "." }
        r8 = board[7].filter { $0 != "." }
        r9 = board[8].filter { $0 != "." }
        
        c1 = board.map {$0[0]}.filter { $0 != "." }
        c2 = board.map {$0[1]}.filter { $0 != "." }
        c3 = board.map {$0[2]}.filter { $0 != "." }
        c4 = board.map {$0[3]}.filter { $0 != "." }
        c5 = board.map {$0[4]}.filter { $0 != "." }
        c6 = board.map {$0[5]}.filter { $0 != "." }
        c7 = board.map {$0[6]}.filter { $0 != "." }
        c8 = board.map {$0[7]}.filter { $0 != "." }
        c9 = board.map {$0[8]}.filter { $0 != "." }
        
        let rows = [r1, r2, r3, r4, r5, r6, r7, r8, r9]
        let cols = [c1, c2 ,c3, c4, c5, c6, c7, c8, c9]
        
        for row in rows {
            if (!isValidArray(row)) {
                return false
            }
        }
        
        for col in cols {
            if (!isValidArray(col)) {
                return false
            }
        }
        
        return true
    }
    
    func isValidArray(_ array: [Character]) -> Bool {
        var _array = [Character]()
        
        for item in array {
            if _array.contains(item) {
                return false
            } else {
                _array.append(item)
            }
        }
        
        return true
    }
    
}
