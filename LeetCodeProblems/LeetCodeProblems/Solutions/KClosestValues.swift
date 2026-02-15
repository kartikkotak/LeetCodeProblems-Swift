/**
 https://leetcode.com/problems/find-k-closest-elements/description/
 
 658. Find K Closest Elements - Medium
 Given a sorted integer array arr, two integers k and x, return the k closest integers to x in the array. The result should also be sorted in ascending order.
 
 An integer a is closer to x than an integer b if:
 
 |a - x| < |b - x|, or
 |a - x| == |b - x| and a < b
 
 Example 1:
 
 Input: arr = [1,2,3,4,5], k = 4, x = 3
 
 Output: [1,2,3,4]
 
 Example 2:
 
 Input: arr = [1,1,2,3,4,5], k = 4, x = -1
 
 Output: [1,1,2,3]
 
 Constraints:
 
 1 <= k <= arr.length
 1 <= arr.length <= 104
 arr is sorted in ascending order.
 -104 <= arr[i], x <= 104
 */

// Optimized Approach - Binary search - O(logn + k) and O(1) space
/**
 • Idea: The answer is a contiguous window of size k in the sorted array. We can binary search for the smallest starting index left in [0, n - k] such that the window [left, left + k - 1] is the best.
 • Use the comparison:
 • If x - arr[mid] > arr[mid + k] - x, then the better window starts to the right, so move left = mid + 1.
 • Else, move right = mid.
 • After the binary search, return arr[left ..< left + k].
 */

func findClosestElementsBinaryWindow(_ arr: [Int], _ k: Int, _ x: Int) -> [Int] {
    var left = 0
    var right = arr.count - k
    while left < right {
        let mid = (left + right) / 2
        // Compare distances between x and the two endpoints around the candidate window
        if x - arr[mid] > arr[mid + k] - x {
            left = mid + 1
        } else {
            right = mid
        }
    }
    return Array(arr[left ..< left + k])
}

// Optimized Approach -2
/**
 - Move left and right pointers, until we have k values in left...right range.
 */
func findClosestElements(_ arr: [Int], _ k: Int, _ x: Int) -> [Int] {
    var lIndex = 0
    var rIndex = arr.count - 1
    
    while rIndex - lIndex >= k {
        if abs(arr[rIndex] - x) >= abs(arr[lIndex] - x) {
            rIndex -= 1
        } else {
            lIndex += 1
        }
    }
    
    return Array(arr[lIndex...rIndex])
}

// Alternative approach - O(n + k) time complexity

/// Returns the k closest integers to x from a sorted array.
///
/// Algorithm overview:
/// 1) Single pass to find the value(s) equal to the closest element to x.
///    - While scanning, build a map from value -> all indices where it occurs.
///    - Track the current `closest` value by comparing |x - num|.
/// 2) Seed the answer with all occurrences of `closest` (ties handled by duplicates).
/// 3) Use two pointers anchored around the min/max indices of `closest` and expand outward:
///    - Compare |x - leftValue| vs |x - rightValue| to pick the next closest.
///    - On ties, prefer the smaller value (left side) to satisfy problem ordering.
/// 4) Concatenate left (reversed) + right to return an ascending result.
///
/// Complexity:
/// - Time: O(n + k) where n is arr.count (single pass to find/prepare + up to k expansions).
/// - Space: O(n) in the worst case for the value->indices map, plus O(k) for the result buffers.
//func findClosestElements(_ arr: [Int], _ k: Int, _ x: Int) -> [Int] {
//    guard arr.count > 0 else { return [] }
//    
//    // First pass: find the value with minimal |x - value| and record indices for each value.
//    // Map from value to all indices where it occurs (to handle duplicates).
//    // Scan array once: update map and maintain the current closest value to x.
//    var closest: Int = arr[0]
//    var map: [Int: [Int]] = [:]
//    
//    arr.enumerated().forEach { index, num in
//        map[num, default: []].append(index)
//        let newDiff = abs(x - num)
//        
//        if newDiff < abs(x - closest) {
//            closest = num
//        }
//    }
//    
//    // Indices of the closest value (may have multiple duplicates).
//    let indexes = map[closest] ?? []
//    var k = k
//    
//    // Fast path: if duplicates of the closest value already satisfy k, return k copies.
//    guard indexes.count < k else {
//        return Array(repeating: closest, count: k)
//    }
//    
//    // Otherwise, seed with duplicates and expand outward using two pointers around the closest block.
//    var leftStack: [Int] = []
//    var rightStack: [Int] = []
//    rightStack.append(contentsOf: Array(repeating: closest, count: indexes.count))
//    k -= indexes.count
//    
//    var minIndex = (indexes.first ?? -1) - 1
//    var maxIndex = (indexes.last ?? arr.count) + 1
//    
//    // Expand until we have k total elements, preferring the side with the smaller absolute difference.
//    while k > 0 {
//        // If one side is exhausted, take from the other.
//        guard minIndex >= 0 && maxIndex < arr.count else {
//            if minIndex >= 0 {
//                leftStack.append(arr[minIndex])
//                minIndex -= 1
//                k -= 1
//                continue
//            }
//            
//            if maxIndex < arr.count {
//                rightStack.append(arr[maxIndex])
//                maxIndex += 1
//                k -= 1
//                continue
//            }
//            break
//        }
//        
//        let leftValue = arr[minIndex]
//        let rightValue = arr[maxIndex]
//        
//        // Tie-breaking: <= ensures we prefer the left (smaller) value when distances are equal.
//        if abs(x - leftValue) <= abs(x - rightValue) {
//            leftStack.append(leftValue)
//            minIndex -= 1
//        } else {
//            rightStack.append(rightValue)
//            maxIndex += 1
//        }
//        k -= 1
//    }
//    return leftStack.reversed() + rightStack
//}

