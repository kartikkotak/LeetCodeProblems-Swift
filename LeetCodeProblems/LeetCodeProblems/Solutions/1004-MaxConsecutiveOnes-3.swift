/**
 https://leetcode.com/problems/max-consecutive-ones-iii/description/
 
 1004. Max Consecutive Ones III
 
 Difficulty: Medium
 
 Hint
 Given a binary array nums and an integer k, return the maximum number of consecutive 1's in the array if you can flip at most k 0's.

 Example 1:
 
 Input: nums = [1,1,1,0,0,0,1,1,1,1,0], k = 2
 Output: 6
 Explanation: [1,1,1,0,0,1,1,1,1,1,1]
 Bolded numbers were flipped from 0 to 1. The longest subarray is underlined.
 */

func longestOnes(_ nums: [Int], _ k: Int) -> Int {
    // Start with left & right pointers at 0th index
    var left = 0
    var right = 0
    
    // Store max result for consecutive 1s
    var result = 0
    var maxResult = 0
    
    // Maintain count of how many 1s flipped.
    var flipped: Int = 0
    
    // Iterate through nums until right pointer reaches to the end
    while right < nums.count {
        switch nums[right] {
        case 1:
            right += 1
        case 0:
            if flipped < k {
                flipped += 1
                right += 1
            } else { // move left pointer
                let count = right - left
                maxResult = max(maxResult, count)
                
                flipped += 1
                while left <= right && flipped > k {
                    if nums[left] == 0 {
                        flipped -= 1
                    }
                    left += 1
                }
                right += 1
            }
            
        default:
            break
        }
    }
    let count = right - left
    return max(maxResult, count)
}
