/**
 https://leetcode.com/problems/reverse-vowels-of-a-string/description/?envType=study-plan-v2&envId=leetcode-75
 
 Given a string s, reverse only all the vowels in the string and return it.
 The vowels are 'a', 'e', 'i', 'o', and 'u', and they can appear in both lower and upper cases, more than once.
 Example 1:
 
 Input: s = "IceCreAm"
 Output: "AceCreIm"
 
 Explanation:
 The vowels in s are ['I', 'e', 'e', 'A']. On reversing the vowels, s becomes "AceCreIm".
 */

func reverseVowels(_ s: String) -> String {
    var chars = Array(s)
    var left = 0
    var right = chars.count - 1
    
    while left < right {
        let leftC = chars[left]
        let rightC = chars[right]
        let isLeftVowel = leftC.isVowel()
        let isRightVowel = rightC.isVowel()
        
        if isLeftVowel && isRightVowel {
            chars.swapAt(left, right)
            left += 1
            right -= 1
        } else if isLeftVowel {
            right -= 1
        } else if isRightVowel {
            left += 1
        } else {
            left += 1
            right -= 1
        }
    }
    
    return String(chars)
}

private extension Character {
    func isVowel() -> Bool {
        switch self.lowercased() {
        case "a", "e", "i", "o", "u":
            return true
        default:
            return false
        }
    }
}
