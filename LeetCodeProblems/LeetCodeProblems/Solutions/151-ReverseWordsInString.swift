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
    
    var result: String = ""
    while let word = words.popLast() {
        if result.count > 0 {
            result.append(" ")
        }
        result.append(contentsOf: word)
    }
    return result
}

private func reverseWord(_ s: String) -> String {
    var l = 0
    var r = s.count - 1
    
    var chars: [Character] = Array(s)
    while l < r {
        chars.swapAt(l, r)
        l += 1
        r -= 1
    }
    return String(chars)
}
