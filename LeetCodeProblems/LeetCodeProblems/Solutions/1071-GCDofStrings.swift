/**
 https://leetcode.com/problems/greatest-common-divisor-of-strings/description/?envType=study-plan-v2&envId=leetcode-75
 
 For two strings s and t, we say "t divides s" if and only if s = t + t + t + ... + t + t (i.e., t is concatenated with itself one or more times).
 
 Given two strings str1 and str2, return the largest string x such that x divides both str1 and str2.
 
 Example 1:
 
 Input: str1 = "ABCABC", str2 = "ABC"
 
 Output: "ABC"
 
 Example 2:
 
 Input: str1 = "ABABAB", str2 = "ABAB"
 
 Output: "AB"
 
 Example 3:
 
 Input: str1 = "LEET", str2 = "CODE"
 
 Output: ""
 
 Example 4:
 
 Input: str1 = "AAAAAB", str2 = "AAA"
 
 Output: ""
 
 
 
 Constraints:
 
 1 <= str1.length, str2.length <= 1000
 str1 and str2 consist of English uppercase letters.
 
 */

func gcdOfStrings(_ str1: String, _ str2: String) -> String {
    guard str1 + str2 == str2 + str1 else {
        return ""
    }
    
    let gcdLength = gcd(length1: max(str1.count, str2.count), length2: min(str1.count, str2.count))
    
    let startIndex = str1.startIndex
    let endIndex = str1.index(startIndex, offsetBy: gcdLength)
    
    return String(str1[startIndex..<endIndex])
}

func gcd(length1: Int, length2: Int) -> Int {
    if length1 % length2 == 0 {
        return length2
    } else {
        return gcd(length1: length2, length2: length1 % length2)
    }
}
