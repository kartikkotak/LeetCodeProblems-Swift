/**
 Medium Difficulty
 
 https://leetcode.com/problems/group-anagrams/description/
 
 Given an array of strings strs, group the anagrams together. You can return the answer in any order.
 
 
 
 Example 1:
 
 Input: strs = ["eat","tea","tan","ate","nat","bat"]
 
 Output: [["bat"],["nat","tan"],["ate","eat","tea"]]
 
 Explanation:
 
 There is no string in strs that can be rearranged to form "bat".
 The strings "nat" and "tan" are anagrams as they can be rearranged to form each other.
 The strings "ate", "eat", and "tea" are anagrams as they can be rearranged to form each other.
 */

func groupAnagrams(_ strs: [String]) -> [[String]] {
    var map: [[Int]: [String]] = [:]
    
    for word in strs {
        let charArray = createWordArray(word)
        map[charArray, default: []].append(word)
    }
    
    return map.values.compactMap{ $0 }
    
    func createWordArray(_ word: String) -> [Int] {
        guard word.count > 0 else {
            return []
        }
        
        var charCount: [Int] = Array(repeating: 0, count: 26)
        for c in word {
            charCount[Int(c.asciiValue!) - 97] += 1
        }
        
        return charCount
    } // Time: O(N*K), Space: O(N*K)
}
