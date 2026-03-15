/**
 https://leetcode.com/problems/squares-of-a-sorted-array/description/
 
 Easy
 
 Given an integer array nums sorted in non-decreasing order, return an array of the squares of each number sorted in non-decreasing order.
 
 Example 1:
 
 Input: nums = [-4,-1,0,3,10]
 Output: [0,1,9,16,100]
 Explanation: After squaring, the array becomes [16,1,0,9,100].
 After sorting, it becomes [0,1,9,16,100].

 */

func sortedSquares(_ nums: [Int]) -> [Int] {
    guard nums.count > 0 else {
        return []
    }
    
    // Create an array of size of nums.count
    var result: [Int] = Array(repeating: 0, count: nums.count)
    
    // Have two pointers one at beginning and another at the end.
    var left = 0
    var right = nums.count - 1
    
    // iterate through each val in result and update it by comparing square values at left and right.
    for i in stride(from: nums.count - 1, through: 0, by: -1) {
        var rightNum = nums[right] * nums[right]
        var leftNum = nums[left] * nums[left]
        
        // Compare left and right values and update index of result with the highest value.
        if rightNum > leftNum {
            result[i] = rightNum
            right -= 1
        } else {
            result[i] = leftNum
            left += 1
        }
    }
    return result
}
