import Testing
@testable import LeetCodeProblems

struct TwoSumSortedListTests {
    
    @Test
    func testCase1() async throws {
        let result = twoSumII([2,7,11,15], 9)
        #expect(result == [1,2])
    }
    
    @Test
    func testCase2() async throws {
        let result = twoSumII([2,3,4], 6)
        #expect(result == [1,3])
    }
    
    @Test
    func testCase3() async throws {
        let result = twoSumII([-1,0], -1)
        #expect(result == [1,2])
    }
    
    @Test
    func testCase4_minimalSize() async throws {
        let result = twoSumII([1,2], 3)
        #expect(result == [1,2])
    }
    
    @Test
    func testCase5_withDuplicates() async throws {
        // Multiple identical numbers; ensure correct 1-based indices are returned.
        let result = twoSumII([1,1,3,5,7], 2)
        #expect(result == [1,2])
    }
    
    @Test
    func testCase6_negativesAndPositives() async throws {
        let result = twoSumII([-10,-3,0,4,9,12], 6)
        // -? + ? = 6 -> -? + 12 doesn't work; -? + 9 etc. Expected  -3 + 9 = 6
        #expect(result == [2,5])
    }
    
    @Test
    func testCase7_largeValues() async throws {
        let result = twoSumII([1_000_000, 2_000_000, 3_000_000, 4_000_000], 5_000_000)
        #expect(result == [1,4])
    }
    
    @Test
    func testCase8_multiplePossiblePairs_chooseLeftmostValid() async throws {
        // For sorted arrays with two-pointer solution, the found pair is deterministic.
        let result = twoSumII([1,2,3,4,4,9,56,90], 8)
        // 4 + 4 using the first 4 at index 4 and the previous numbers leads to [4,5]
        #expect(result == [4,5])
    }
    
    @Test
    func testCase9_targetAtExtremes() async throws {
        let result = twoSumII([1,2,3,9,11,15], 16)
        // 1-based indices for 1 + 15
        #expect(result == [1,6])
    }
}
