/**
 Difficulty: Medium
 https://leetcode.com/problems/maximum-product-subarray/description/
 
 Given an integer array nums, find a subarray that has the largest product, and return the product.
 
 The test cases are generated so that the answer will fit in a 32-bit integer.
 
 Note that the product of an array with a single element is the value of that element.
 
 Example 1:
 
 Input: nums = [2,3,-2,4]
 Output: 6
 Explanation: [2,3] has the largest product 6.
 Example 2:
 
 Input: nums = [-2,0,-1]
 Output: 0
 Explanation: The result cannot be 2, because [-2,-1] is not a subarray.
 
 */


func maxProduct(_ nums: [Int]) -> Int {
    guard nums.count > 0 else { return 0 }
    
    var current = 1
    var max_product = nums[0]
    var min_product = nums[0]
    var result = max_product
    
    while current < nums.count {
        let curr = nums[current]
        let curr_product = max(max(max_product * curr, min_product * curr), curr)
        min_product = min(min(max_product * curr, min_product * curr), curr)
        max_product = curr_product
        result = max(max_product, result)
        current += 1
    }
    
    return result
}
