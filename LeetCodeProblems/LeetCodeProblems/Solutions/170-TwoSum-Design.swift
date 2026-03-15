/**
 https://leetcode.com/problems/two-sum-iii-data-structure-design/description/
 
 Design a data structure that accepts a stream of integers and checks if it has a pair of integers that sum up to a particular value.
 
 Implement the TwoSum class:
 
 TwoSum() Initializes the TwoSum object, with an empty array initially.
 void add(int number) Adds number to the data structure.
 boolean find(int value) Returns true if there exists any pair of numbers whose sum is equal to value, otherwise, it returns false.
 */

class TwoSum {
    private var map: [Int: Int]
    
    init() {
        map = [Int: Int]()
    }
    
    func add(_ number: Int) {
        map[number] = (map[number] ?? 0) + 1
    }
    
    func find(_ value: Int) -> Bool {
        for key in map.keys {
            let counter = value - key
            guard let count = map[counter] else { continue }
            if key != counter || count > 1 {
                return true
            }
        }
        
        return false
    }
}
