import Testing
@testable import LeetCodeProblems

struct ValidWordAbbrTests_Class {
    
    @Test
    func testExamplesFromPrompt() async throws {
        let vwa = await ValidWordAbbr(["deer", "door", "cake", "card"])
        #expect(vwa.isUnique("dear") == false) // d2r exists for deer/door
        #expect(vwa.isUnique("cart") == true)  // c2t not present
        #expect(vwa.isUnique("cane") == false) // c2e collides with cake
        #expect(vwa.isUnique("make") == true)  // m2e not present
        #expect(vwa.isUnique("cake") == true)  // same word present with same abbr
    }
    
    @Test
    func testTwoLetterWords() async throws {
        // Words with exactly two letters are their own abbreviation.
        let vwa = await ValidWordAbbr(["it", "is", "in"])
        #expect(vwa.isUnique("at") == true)
        #expect(vwa.isUnique("it") == true)
        #expect(vwa.isUnique("is") == true)
        #expect(vwa.isUnique("in") == true)
        #expect(vwa.isUnique("on") == true)
    }
    
    @Test
    func testSameAbbreviationDifferentWords() async throws {
        let vwa = await ValidWordAbbr(["deer", "door"])
        #expect(vwa.isUnique("dear") == false)
        #expect(vwa.isUnique("doer") == false)
    }
    
    @Test
    func testDuplicateWordsInDictionary() async throws {
        let vwa = await ValidWordAbbr(["cake", "cake", "card"])
        #expect(vwa.isUnique("cake") == true)
        #expect(vwa.isUnique("cane") == false)
        #expect(vwa.isUnique("card") == true)
    }
    
    @Test
    func testWordsNotInDictionary() async throws {
        let vwa = await ValidWordAbbr(["hello", "world"])
        #expect(vwa.isUnique("help") == true)
        #expect(vwa.isUnique("held") == true)
    }
    
    @Test
    func testBoundaryLengths() async throws {
        // Very short and longer words
        let vwa = await ValidWordAbbr(["a", "ab", "abc", "abcd", "abce"])
        #expect(vwa.isUnique("ab") == true)
        #expect(vwa.isUnique("abc") == true)
        #expect(vwa.isUnique("abcf") == true)
        #expect(vwa.isUnique("abed") == false)
    }
}
