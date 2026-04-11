//
//  MinAbsoluteDiff.swift
//  LeetCodeProblems
//
//  Created by Kartik Kotak on 3/28/26.
//

func minAbsoluteDifference(_ nums: [Int]) -> Int {
    guard nums.count > 1 else { return -1 }
    var oneIndex: Int = -1
    var twoIndex: Int = -1
    var result: Int = Int.max
    
    for (index, num) in nums.enumerated() {
        switch num {
        case 1:
            oneIndex = index
            if twoIndex != -1 {
                result = min(result , abs(index - twoIndex))
            }
        case 2:
            twoIndex = index
            if oneIndex != -1 {
                result = min(result, abs(index - oneIndex))
            }
        default:
            continue
        }
    }
    return result == Int.max ? -1 : result
}

