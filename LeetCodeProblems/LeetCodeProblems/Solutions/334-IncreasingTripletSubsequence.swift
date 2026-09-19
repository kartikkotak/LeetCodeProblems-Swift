/*
 https://leetcode.com/problems/increasing-triplet-subsequence/?envType=study-plan-v2&envId=leetcode-75
 
 Example 1:
 Input: nums = [1,2,3,4,5]
 Output: true
 Explanation: Any triplet where i < j < k is valid.
 
 Example 2:
 Input: nums = [5,4,3,2,1]
 Output: false
 Explanation: No triplet exists.
 
 Example 3:
 Input: nums = [2,1,5,0,4,6]
 Output: true
 Explanation: One of the valid triplet is (1, 4, 5), because nums[1] == 1 < nums[4] == 4 < nums[5] == 6.
*/

func increasingTriplet(_ nums: [Int]) -> Bool {
    var first_num = Int.max
    var second_num = Int.max
    
    for n in nums {
        if n <= first_num {
            first_num = n
        } else if n <= second_num {
            second_num = n
        } else {
            return true
        }
    }
    return false
}
