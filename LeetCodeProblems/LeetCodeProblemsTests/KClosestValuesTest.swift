import Testing
@testable import LeetCodeProblems

struct KClosestValuesTest {
    
    @Test
    func testCase1() async throws {
        let result = findClosestElementsBinaryWindow(
            [1, 2, 3, 4, 5],
            4,
            3
        )
        #expect(result == [1, 2, 3, 4])
    }
    
    @Test
    func testCase2() async throws {
        let result = findClosestElementsBinaryWindow(
            [1,1,2,3,4,5],
            4,
            -1
        )
        #expect(result == [1,1,2,3])
    }
    
    @Test
    func testCase3() async throws {
        let result = findClosestElementsBinaryWindow(
            [1,3],
            1,
            2
        )
        #expect(result == [1])
    }
}
