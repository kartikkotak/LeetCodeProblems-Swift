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
}
