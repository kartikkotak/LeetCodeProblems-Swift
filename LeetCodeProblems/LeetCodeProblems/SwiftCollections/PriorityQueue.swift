struct PriorityQueue<Element> {
    private var heap: [Element] = []
    private let areSorted: (Element, Element) -> Bool
    
    /// - Parameter sort: returns true if first element should be ordered before second
    /// For min-heap: `<`
    /// For max-heap: `>`
    init(sort: @escaping (Element, Element) -> Bool) {
        self.areSorted = sort
    }
    
    var isEmpty: Bool {
        heap.isEmpty
    }
    
    var count: Int {
        heap.count
    }
    
    var peek: Element? {
        heap.first
    }
    
    mutating func enqueue(_ element: Element) {
        heap.append(element)
        siftUp(from: heap.count - 1)
    }
    
    @discardableResult
    mutating func dequeue() -> Element? {
        guard !heap.isEmpty else { return nil }
        
        if heap.count == 1 {
            return heap.removeLast()
        }
        
        heap.swapAt(0, heap.count - 1)
        let removed = heap.removeLast()
        siftDown(from: 0)
        return removed
    }
    
    private mutating func siftUp(from index: Int) {
        var child = index
        var parent = parentIndex(of: child)
        
        while child > 0 && areSorted(heap[child], heap[parent]) {
            heap.swapAt(child, parent)
            child = parent
            parent = parentIndex(of: child)
        }
    }
    
    private mutating func siftDown(from index: Int) {
        var parent = index
        
        while true {
            let left = leftChildIndex(of: parent)
            let right = rightChildIndex(of: parent)
            var candidate = parent
            
            if left < heap.count && areSorted(heap[left], heap[candidate]) {
                candidate = left
            }
            
            if right < heap.count && areSorted(heap[right], heap[candidate]) {
                candidate = right
            }
            
            if candidate == parent { return }
            
            heap.swapAt(parent, candidate)
            parent = candidate
        }
    }
    
    private func parentIndex(of index: Int) -> Int {
        (index - 1) / 2
    }
    
    private func leftChildIndex(of index: Int) -> Int {
        2 * index + 1
    }
    
    private func rightChildIndex(of index: Int) -> Int {
        2 * index + 2
    }
}
