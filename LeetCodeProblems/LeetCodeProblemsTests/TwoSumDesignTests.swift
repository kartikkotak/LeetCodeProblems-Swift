import Testing
@testable import LeetCodeProblems


struct TwoSumDesignTests {
    
    @Test
    func testEmptyReturnsFalse() throws {
        let ts = TwoSum()
        #expect(ts.find(0) == false)
        #expect(ts.find(10) == false)
        #expect(ts.find(-5) == false)
    }
    
    @Test
    func testSingleElementCannotFormPair() throws {
        let ts = TwoSum()
        ts.add(3)
        #expect(ts.find(6) == false)
        #expect(ts.find(3) == false)
    }
    
    @Test
    func testDuplicatesEnableSameNumberPair() throws {
        let ts = TwoSum()
        ts.add(4)
        ts.add(4)
        #expect(ts.find(8) == true) // 4 + 4
        #expect(ts.find(7) == false)
    }
    
    @Test
    func testMultipleNumbersFormPairs() throws {
        let ts = TwoSum()
        ts.add(1)
        ts.add(5)
        ts.add(3)
        ts.add(7)
        #expect(ts.find(8) == true)  // 1 + 7 or 5 + 3
        #expect(ts.find(10) == true) // 3 + 7
        #expect(ts.find(2) == false)
    }
    
    @Test
    func testNegativeNumbers() throws {
        let ts = TwoSum()
        ts.add(-2)
        ts.add(-3)
        ts.add(5)
        #expect(ts.find(3) == true)   // -? + ? = 3 -> -? + 5 = 3 => -2 + 5
        #expect(ts.find(-5) == true)  // -2 + -3
        #expect(ts.find(0) == false)
    }
    
    @Test
    func testLargeValues() throws {
        let ts = TwoSum()
        ts.add(1_000_000_000)
        ts.add(-1_000_000_000)
        ts.add(2)
        #expect(ts.find(0) == true)   // 1e9 + (-1e9)
        #expect(ts.find(1_000_000_002) == true) // 1e9 + 2
    }
    
    @Test
    func testIncrementalAddsAndQueries() throws {
        let ts = TwoSum()
        #expect(ts.find(4) == false)
        ts.add(1)
        #expect(ts.find(2) == false)
        ts.add(3)
        #expect(ts.find(4) == true) // 1 + 3
        ts.add(2)
        #expect(ts.find(5) == true) // 3 + 2
        ts.add(3)
        #expect(ts.find(6) == true) // 3 + 3 (duplicates)
    }
}

