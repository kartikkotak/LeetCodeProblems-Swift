/**
 Difficulty - Easy
 
 https://leetcode.com/problems/find-pivot-index/description/
 
 Given an array of integers nums, calculate the pivot index of this array.
 The pivot index is the index where the sum of all the numbers strictly to the left of the index is equal to the sum of all the numbers strictly to the index's right.
 If the index is on the left edge of the array, then the left sum is 0 because there are no elements to the left. This also applies to the right edge of the array.
 
 Return the leftmost pivot index. If no such index exists, return -1.
 
 Example 1:
 
 Input: nums = [1,7,3,6,5,6]
 Output: 3
 Explanation:
 The pivot index is 3.
 Left sum = nums[0] + nums[1] + nums[2] = 1 + 7 + 3 = 11
 Right sum = nums[4] + nums[5] = 5 + 6 = 11
 */

func pivotIndex(_ nums: [Int]) -> Int {
    let sSum: [Int] = suffixSum(nums)
    var pSum = 0
    for i in 0..<nums.count {
        if sSum[i] == pSum { return i }
        pSum += nums[i]
    }
    
    return -1
}

private func suffixSum(_ nums: [Int]) -> [Int] {
    guard nums.count > 0 else { return nums }
    var sSum: [Int] = Array(repeating: 0, count: nums.count)
    var sum = nums[nums.count - 1]
    for i in stride(from: nums.count - 2, through: 0, by: -1) {
        sSum[i] = sum
        sum += nums[i]
    }
    return sSum
}
