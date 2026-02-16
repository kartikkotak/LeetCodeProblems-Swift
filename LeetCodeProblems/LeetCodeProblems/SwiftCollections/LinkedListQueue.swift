//
//  LinkedListQueue.swift
//
//  Created by Kartik Kotak on 2/16/26.
//


// MARK: - LinkedList + Queue (O(1) enqueue/dequeue)

public struct LinkedListQueue<Element>: Queue {

    public final class Node {
        public var value: Element
        public var next: Node?

        public init(_ value: Element) {
            self.value = value
        }
    }

    private var head: Node?
    private var tail: Node?
    private(set) public var count: Int = 0

    public init() {}

    public var isEmpty: Bool { head == nil }
    public var peek: Element? { head?.value }

    // O(1)
    public mutating func enqueue(_ element: Element) {
        let new = Node(element)
        if let t = tail {
            t.next = new
            tail = new
        } else {
            head = new
            tail = new
        }
        count += 1
    }

    // O(1)
    @discardableResult
    public mutating func dequeue() -> Element? {
        guard let h = head else { return nil }
        head = h.next
        if head == nil { tail = nil }
        count -= 1
        h.next = nil
        return h.value
    }

    public mutating func removeAll() {
        head = nil
        tail = nil
        count = 0
    }
}
