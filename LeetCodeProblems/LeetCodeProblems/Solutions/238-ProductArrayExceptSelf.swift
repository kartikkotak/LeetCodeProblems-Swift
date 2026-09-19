/**
 https://leetcode.com/problems/product-of-array-except-self/?envType=study-plan-v2&envId=leetcode-75
 
 Example 1:
 Input: nums = [1,2,3,4]
 Output: [24,12,8,6]
 
 Example 2:
 Input: nums = [-1,1,0,-3,3]
 Output: [0,0,9,0,0]
 */

func productExceptSelf(_ nums: [Int]) -> [Int] {
    var output: [Int] = Array(repeating: 0, count: nums.count)
    var zeroIndex = -1
    var product: Int = 1
    for (index, num) in nums.enumerated() {
        if num == 0 {
            guard zeroIndex == -1 else { return output }
            zeroIndex = index
            continue
        }
        product *= num
    }
    
    if zeroIndex != -1 {
        output[zeroIndex] = product
        return output
    }
    
    for (index, num) in nums.enumerated() {
        output[index] = product / num
    }
    
    return output
}
