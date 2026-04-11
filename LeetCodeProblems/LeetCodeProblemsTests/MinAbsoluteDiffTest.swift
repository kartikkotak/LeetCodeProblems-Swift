//
//  MinAbsoluteDiffTest.swift
//  LeetCodeProblems
//
//  Created by Kartik Kotak on 3/28/26.
//

import Testing
@testable import LeetCodeProblems

class MinAbsoluteDiffTest {
    @Test func minAbsoluteDifference() async throws {
        #expect(LeetCodeProblems.minAbsoluteDifference([1,0,1,0]) == 2)
    }
}
