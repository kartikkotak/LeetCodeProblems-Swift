
/**
 https://leetcode.com/problems/letter-combinations-of-a-phone-number/description/
 
 Given a string containing digits from 2-9 inclusive, return all possible letter combinations that the number could represent. Return the answer in any order.
 
 A mapping of digits to letters (just like on the telephone buttons) is given below. Note that 1 does not map to any letters.
 
 Example 1:
 
 Input: digits = "23"
 Output: ["ad","ae","af","bd","be","bf","cd","ce","cf"]
 Example 2:
 
 Input: digits = "2"
 Output: ["a","b","c"]
 
 
 Constraints:
 
 1 <= digits.length <= 4
 digits[i] is a digit in the range ['2', '9'].
 */

fileprivate let phoneDict: [Character: [Character]] =
[
    "2": Array("abc"),
    "3": Array("def"),
    "4": Array("ghi"),
    "5": Array("jkl"),
    "6": Array("mno"),
    "7": Array("pqrs"),
    "8": Array("tuv"),
    "9": Array("wxyz")
]

func letterCombinations(_ digits: String) -> [String] {
    guard digits.count > 0 else {
        return []
    }
    
    var result: [String] = []
    var digitsChar: [Character] = Array(digits)
    
    func backtrack(idx: Int, comb: String) {
        if idx == digits.count {
            result.append(comb)
            return
        }
        
        for letter in phoneDict[digitsChar[idx], default: []] {
            let newComb = "\(comb)\(letter)"
            backtrack(idx: idx + 1, comb: newComb)
        }
    }
    
    backtrack(idx: 0, comb: "")
    return result
}
