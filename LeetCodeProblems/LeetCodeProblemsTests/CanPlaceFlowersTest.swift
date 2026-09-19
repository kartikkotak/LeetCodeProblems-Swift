import Testing
@testable import LeetCodeProblems

struct CanPlaceFlowersTest {
    @Test(
        "CanPlaceFlowerCases",
        arguments:
        [
            (flowerBed: [1,0,0,0,1], n: 1, true),
            (flowerBed: [1,0,0,0,1], n: 2, false),
        ]
    )
    func testFlowerBedCases(flowerBed: [Int], n: Int, output: Bool) async throws {
        #expect(canPlaceFlowers(flowerBed, n) == output)
    }
}
