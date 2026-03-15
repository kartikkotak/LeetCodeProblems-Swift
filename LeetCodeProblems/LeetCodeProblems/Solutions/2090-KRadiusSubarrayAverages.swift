/**
 
 https://leetcode.com/problems/k-radius-subarray-averages/description/
 
 2090. K Radius Subarray Averages
 Difficulty: Medium
 
 
 */

func getAverages(_ nums: [Int], _ k: Int) -> [Int] {
    
    guard k != 0 else { return nums }
    
    let diameter = k * 2 + 1
    
    var result = Array(repeating: -1, count: nums.count)
    var left = 0
    var sum = nums[0]
    
    for right in 1..<nums.count {
        sum += nums[right]
        
        if right - left + 1 == diameter {
            result[left + k] = sum / diameter
            sum -= nums[left]
            left += 1
        }
    }
    
    return result
}
