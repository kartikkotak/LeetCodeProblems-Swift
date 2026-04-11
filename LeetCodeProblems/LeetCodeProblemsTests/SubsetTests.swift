import Testing
@testable import LeetCodeProblems

struct SubsetTests {
    @Test(
        "Subset Tests", arguments: [
            ([1,2,3], [[],[1],[2],[1,2],[3],[1,3],[2,3],[1,2,3]])
        ]
    )
    func testSubsets(_ input: [Int], _ expected: [[Int]]) async throws {
        let result = subsets(input)
        print(result)
        #expect(result == expected)
    }
}
