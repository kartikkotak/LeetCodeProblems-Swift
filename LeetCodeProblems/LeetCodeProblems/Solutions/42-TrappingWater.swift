/**
 https://leetcode.com/problems/trapping-rain-water/description/
 Difficulty: Hard
 
 Given n non-negative integers representing an elevation map where the width of each bar is 1, compute how much water it can trap after raining.
 
 Example 1:
  
 Input: height = [0,1,0,2,1,0,1,3,2,1,2,1]
 Output: 6
 Explanation: The above elevation map (black section) is represented by array [0,1,0,2,1,0,1,3,2,1,2,1]. In this case, 6 units of rain water (blue section) are being trapped.
 */

func trap(_ height: [Int]) -> Int {
    var leftMax = height[0]
    var l = 0
    var r = height.count - 1
    var rightMax = height[r]
    
    var result: Int = 0
    while l < r {
        if height[l] < height[r] {
            leftMax = max(leftMax, height[l])
            result += leftMax - height[l]
            l += 1
        } else {
            rightMax = max(rightMax, height[r])
            result += rightMax - height[r]
            r -= 1
        }
    }
    
    return result
}
