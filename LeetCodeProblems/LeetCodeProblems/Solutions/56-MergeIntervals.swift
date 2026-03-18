/**
 Medium difficult
 
 https://leetcode.com/problems/merge-intervals/description/
 
 Given an array of intervals where intervals[i] = [starti, endi], merge all overlapping intervals, and return an array of the non-overlapping intervals that cover all the intervals in the input.
 Example 1:
 
 Input: intervals = [[1,3],[2,6],[8,10],[15,18]]
 Output: [[1,6],[8,10],[15,18]]
 Explanation: Since intervals [1,3] and [2,6] overlap, merge them into [1,6].
 */


func merge(_ intervals: [[Int]]) -> [[Int]] {
    guard intervals.count > 1 else {
        return intervals
    }
    
    var sorted: [[Int]] = intervals.sorted { $0[0] <= $1[0] }
    var result: [[Int]] = []
    var prevStart = sorted[0][0]
    var prevEnd = sorted[0][1]
    
    for index in 1..<sorted.count {
        let newInterval = sorted[index]
        if newInterval[0] > prevEnd {
            result.append([prevStart, prevEnd])
            prevStart = newInterval[0]
            prevEnd = newInterval[1]
        } else {
            prevEnd = max(prevEnd, newInterval[1])
        }
    }
    
    result.append([prevStart, prevEnd])
    return result
} // Time: O(NLOG(N)),  Space: O(N)
