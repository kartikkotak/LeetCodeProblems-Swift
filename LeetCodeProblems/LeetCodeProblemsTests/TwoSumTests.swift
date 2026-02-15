import Testing
@testable import LeetCodeProblems

struct TwoSumTests {
    
    @Test
    func testCase1() async throws {
        let result = twoSum([2,7,11,15], 9)
        #expect(result == [0,1])
    }
    
    @Test
    func testCase2() async throws {
        let result = twoSum([3,2,4], 6)
        #expect(result == [1,2])
    }
    
    @Test
    func testCase3() async throws {
        let result = twoSum([3,3], 6)
        #expect(result == [0,1])
    }
}
