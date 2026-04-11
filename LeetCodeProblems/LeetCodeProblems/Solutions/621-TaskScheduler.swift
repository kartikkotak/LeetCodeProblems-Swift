/**
 Medium difficulty
 
 You are given an array of CPU tasks, each labeled with a letter from A to Z, and a number n. Each CPU interval can be idle or allow the completion of one task. Tasks can be completed in any order, but there's a constraint: there has to be a gap of at least n intervals between two tasks with the same label.
 
 Return the minimum number of CPU intervals required to complete all tasks.
 
 Example 1:
 
 Input: tasks = ["A","A","A","B","B","B"], n = 2
 
 Output: 8
 
 Explanation: A possible sequence is: A -> B -> idle -> A -> B -> idle -> A -> B.
 
 After completing task A, you must wait two intervals before doing A again. The same applies to task B. In the 3rd interval, neither A nor B can be done, so you idle. By the 4th interval, you can do A again as 2 intervals have passed.
 */

func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
    var freq = Array(repeating: 0, count: 26)
    for task in tasks {
        freq[Int(task.asciiValue ?? 0) - Int(Character("A").asciiValue ?? 0)] += 1
    }
    
    freq.sort()
    
    let maxFreq = freq[25] - 1
    var idleSlots = maxFreq * n
    
    for i in stride(from: 24, through: 0, by: -1) {
        idleSlots -= min(maxFreq, freq[i])
    }
    
    return idleSlots > 0 ? idleSlots + tasks.count : tasks.count
}


// Approach 2 - math
func leastInterval_2(_ tasks: [Character], _ n: Int) -> Int {
    var freq = Array(repeating: 0, count: 26)
    var maxCount = 0
    for task in tasks {
        let index = Int(task.asciiValue ?? 0) - Int(Character("A").asciiValue ?? 0)
        freq[index] += 1
        maxCount = max(maxCount, freq[index])
    }
    
    var time = (maxCount - 1) * (n + 1)
    for f in freq {
        if f == maxCount { time += 1 }
    }
    
    return max(tasks.count, time)
}


// Approach 3 - Use priority queue
