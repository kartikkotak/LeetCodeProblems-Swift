/**
 https://leetcode.com/problems/longest-palindromic-substring/
 
 5. Longest Palindromic Substring - Medium
 
 Given a string s, return the longest palindromic substring in s.
 
 Example 1:
 Input: s = "babad"
 Output: "bab"
 Explanation: "aba" is also a valid answer.
 Example 2:
 
 Input: s = "cbbd"
 Output: "bb"
 
 Constraints:
 
 1 <= s.length <= 1000
 s consist of only digits and English letters.
 */


/// Approach 1: Treat each n as center and expand from center to check palindromic string
/// Time complexity: O(n^2)
/// Space complexity: O(1)
func longestPalindrome(_ s: String) -> String {
    let chars: [Character] = Array(s)
    var ans: (left: Int, right: Int) = (0, 0)
    
    for index in 0..<chars.count {
        let oddLength = expand(left: index, right: index, chars: chars)
        if oddLength > ans.right - ans.left + 1 {
            let dist = oddLength / 2
            ans = (index - dist, index + dist)
        }
        
        let evenLength = expand(left: index, right: index + 1, chars: chars)
        if evenLength > ans.right - ans.left + 1 {
            let dist = (evenLength / 2) - 1
            ans = (index - dist, index + dist + 1)
        }
    }
    
    return String(chars[ans.left...ans.right])
}

func expand(left: Int, right: Int, chars: [Character]) -> Int {
    var left = left
    var right = right
    
    while left >= 0 && right < chars.count && chars[left] == chars[right] {
        left -= 1
        right += 1
    }
    return right - left - 1
}


// Approach 2 - Time limit exceeded O(n^3)

//var longestString = ""
//func longestPalindrome(_ s: String) -> String {
//    let chars: [Character] = Array(s)
//    
//    longestPalindrome(chars: chars)
//    
//    return longestString
//}
//
//private func longestPalindrome(chars: [Character]) {
//    if chars.isEmpty { return }
//    
//    if checkPalindrome(chars) {
//        if chars.count > longestString.count {
//            longestString = String(chars)
//        }
//        return
//    }
//    
//    longestPalindrome(chars: Array(chars[0..<chars.count - 1]))
//    longestPalindrome(chars: Array(chars[1..<chars.count]))
//}
//
//private func checkPalindrome(_ chars: [Character]) -> Bool {
//    var left = 0
//    var right = chars.count - 1
//    
//    while left < right {
//        if chars[left] != chars[right] {
//            return false
//        }
//        left += 1
//        right -= 1
//    }
//    return true
//}


