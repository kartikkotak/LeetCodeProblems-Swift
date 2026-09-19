/**
 https://leetcode.com/problems/can-place-flowers/description/?envType=study-plan-v2&envId=leetcode-75
 
 You have a long flowerbed in which some of the plots are planted, and some are not. However, flowers cannot be planted in adjacent plots.
 Given an integer array flowerbed containing 0's and 1's, where 0 means empty and 1 means not empty, and an integer n, return true if n new flowers can be planted in the flowerbed without violating the no-adjacent-flowers rule and false otherwise.
 
 Example 1:
 Input: flowerbed = [1,0,0,0,1], n = 1
 Output: true
 
 Example 2:
 Input: flowerbed = [1,0,0,0,1], n = 2
 Output: false
 */

func canPlaceFlowers(_ flowerbed: [Int], _ n: Int) -> Bool {
    var flowerbed = flowerbed
    var n = n
    var index = 0
    
    while index < flowerbed.count, n > 0 {
        if canPlot(index: index, flowerbed: flowerbed) {
            flowerbed[index] = 1
            index += 1
            n -= 1
        }
        index += 1
    }
    
    return n == 0
}

func canPlot(index: Int, flowerbed: [Int]) -> Bool {
    guard flowerbed[index] == 0 else {
        return false
    }
    
    if index > 0, flowerbed[index - 1] == 1 {
        return false
    }
    
    if index < flowerbed.count - 1, flowerbed[index + 1] == 1 {
        return false
    }
    
    return true
}
