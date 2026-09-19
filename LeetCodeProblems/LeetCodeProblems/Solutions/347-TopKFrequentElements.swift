/**
 
 https://leetcode.com/problems/top-k-frequent-elements/description/
 func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
 let frequencies = nums.reduce(into: [Int: Int]()) { map, num in
 map[num, default: 0] += 1
 }
 
 print(frequencies)
 
 if k >= nums.count {
 return frequencies.map { $0.key }
 }
 
 // return frequencies[0..<k].map { return $0.key }
 
 // Min heap of size K
 var queue = PriorityQueue<(Int, Int)>(sort: { $0.1 < $1.1  })
 frequencies.forEach { pair in
 if let smallest = queue.peek, smallest.1 < pair.value {
 if queue.count >= k {
 queue.dequeue()
 }
 }
 queue.enqueue((pair.key, pair.value))
 }
 
 print(queue.count)
 
 var result: [Int] = []
 
 while let popped = queue.dequeue(), result.count <= k {
 result.append(popped.0)
 }
 
 return result
 }
 */


func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
    let frequencies = nums.reduce(into: [Int: Int]()) { map, num in
        map[num, default: 0] += 1
    }
    
    print(frequencies)
    
    if k >= nums.count {
        return frequencies.map { $0.key }
    }
    
    // return frequencies[0..<k].map { return $0.key }
    
    // Min heap of size K
    var queue = PriorityQueue<(Int, Int)>(sort: { $0.1 < $1.1  })
    frequencies.forEach { pair in
        if let smallest = queue.peek, smallest.1 < pair.value {
            if queue.count >= k {
                queue.dequeue()
            }
        }
        queue.enqueue((pair.key, pair.value))
    }
    
    print(queue.count)
    
    var result: [Int] = []
    
    while let popped = queue.dequeue(), result.count <= k {
        result.append(popped.0)
    }
    
    return result
}

//Approach 2: Bucket sort
func topKFrequent_BucketSort(_ nums: [Int], _ k: Int) -> [Int] {
    // Step 1: Frequency map
    var freq: [Int: Int] = [:]
    for num in nums {
        freq[num, default: 0] += 1
    }
    
    // Step 2: Bucket array
    var buckets = Array(repeating: [Int](), count: nums.count + 1)
    
    for (num, count) in freq {
        buckets[count].append(num)
    }
    
    // Step 3: Collect top k
    var result: [Int] = []
    
    for i in stride(from: buckets.count - 1, through: 0, by: -1) {
        for num in buckets[i] {
            result.append(num)
            if result.count == k {
                return result
            }
        }
    }
    
    return result
}
