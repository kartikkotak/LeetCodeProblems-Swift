/**
 https://leetcode.com/problems/two-sum/description/
 
 Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.
 
 You may assume that each input would have exactly one solution, and you may not use the same element twice.
 
 You can return the answer in any order.
 Example 1:
 
 Input: nums = [2,7,11,15], target = 9
 Output: [0,1]
 Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].
 Example 2:
 
 Input: nums = [3,2,4], target = 6
 Output: [1,2]
 Example 3:
 
 Input: nums = [3,3], target = 6
 Output: [0,1]
 
 Constraints:
 
 2 <= nums.length <= 104
 -109 <= nums[i] <= 109
 -109 <= target <= 109
 Only one valid answer exists.
*/

/// Returns indices of two numbers in `nums` that add up to `target`.
///
/// Approach (single-pass hash map):
/// - Iterate once over the array.
/// - For each element `num` at `index`, compute the complement `target - num`.
/// - If the complement has been seen before (stored in a dictionary from value -> index),
///   we have found the pair and return the two indices immediately.
/// - Otherwise, store `num` with its `index` and continue.
///
/// Complexity:
/// - Time: O(n) average, where n = nums.count (each element is looked up/inserted once).
/// - Space: O(n) for the dictionary in the worst case.
func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var indexMap: [Int: Int] = [:]
    indexMap.reserveCapacity(nums.count)
    
    for (index, num) in nums.enumerated() {
        let complement = target - num
        if let prevIndex = indexMap[complement] {
            return [prevIndex, index]
        }
        indexMap[num] = index
    }
    return [-1, -1]
}
