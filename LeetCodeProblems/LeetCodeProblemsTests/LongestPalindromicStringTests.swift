import Testing
@testable import LeetCodeProblems

struct LongestPalindromicStringTests {
    
    @Test(
        arguments: [
            ("babad", "bab"),
            ("cbbd", "bb")
        ]
    )
    func testPalindromicStrings(input: String, expected: String) throws {
        #expect(longestPalindrome(input) == expected)
    }
}
