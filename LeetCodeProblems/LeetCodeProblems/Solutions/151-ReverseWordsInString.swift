/**
 https://leetcode.com/problems/reverse-words-in-a-string/?envType=study-plan-v2&envId=leetcode-75
 
 Example 1:
 
 Input: s = "the sky is blue"
 Output: "blue is sky the"
 
 */

func reverseWords(_ s: String) -> String {
    guard s.count > 1 else {
        return s
    }
    
    // Get list of words from the given String
    var words: [String] = s.split(separator: " ").map { String($0) }
    var left = 0
    var right = words.count - 1
    
    while left < right {
        words.swapAt(left, right)
        left += 1
        right -= 1
    }
    return words.joined(separator: " ")
}
