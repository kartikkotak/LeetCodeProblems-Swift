@testable import LeetCodeProblems
import Testing


struct TaskSchedulerTests {
    @Test
    func schedulerTest() async throws {
        #expect(leastInterval(["A", "A", "A", "B", "B", "B"], 2) == 8)
    }
}
