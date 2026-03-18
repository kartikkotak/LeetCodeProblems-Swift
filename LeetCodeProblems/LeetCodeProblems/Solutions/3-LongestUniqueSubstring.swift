/**
 Difficulty: Medium
 https://leetcode.com/problems/longest-substring-without-repeating-characters/description/
 
 Given a string s, find the length of the longest substring without duplicate characters.
 
 Example 1:
 
 Input: s = "abcabcbb"
 Output: 3
 Explanation: The answer is "abc", with the length of 3. Note that "bca" and "cab" are also correct answers.
 */

func lengthOfLongestSubstring(_ s: String) -> Int {
    guard s.count > 1 else {
        return s.count
    }
    var leftPointer = 0
    
    // Create character : Index Map
    var cMap: [Character: Int] = [:]
    cMap.reserveCapacity(s.count)
    
    // Keep this variable to store max longest string
    var longestString = 0
    
    // Iterate through each character
    for (index, c) in s.enumerated() {
        
        // Find if the value already exists and if it's greater than left Pointer
        if let lastIndex = cMap[c], lastIndex >= leftPointer {
            // Move left pointer
            leftPointer = lastIndex + 1
        }
        cMap[c] = index
        
        // Calculate and update longest string count if greater than previous one
        longestString = max(index - leftPointer + 1, longestString)
    }
    return longestString
} // Time: O(N), Space: O(N)
