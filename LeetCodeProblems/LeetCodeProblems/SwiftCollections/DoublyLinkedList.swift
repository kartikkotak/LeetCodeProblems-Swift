//
//  DoublyLinkedList.swift
//
//  Created by Kartik Kotak on 2/16/26.
//


// MARK: - Doubly Linked List (with prev)

public struct DoublyLinkedList<Element> {

    public final class Node {
        public var value: Element
        public var next: Node?
        public weak var prev: Node?   // weak to avoid retain cycles

        public init(_ value: Element) {
            self.value = value
        }
    }

    private(set) public var head: Node?
    private(set) public var tail: Node?

    public init() {}

    public var isEmpty: Bool { head == nil }

    // O(1)
    public mutating func pushFront(_ value: Element) {
        let new = Node(value)
        if let h = head {
            new.next = h
            h.prev = new
            head = new
        } else {
            head = new
            tail = new
        }
    }

    // O(1)
    public mutating func append(_ value: Element) {
        let new = Node(value)
        if let t = tail {
            t.next = new
            new.prev = t
            tail = new
        } else {
            head = new
            tail = new
        }
    }

    // O(1)
    @discardableResult
    public mutating func popFront() -> Element? {
        guard let h = head else { return nil }
        let value = h.value

        let next = h.next
        next?.prev = nil
        head = next

        if head == nil { tail = nil }
        h.next = nil
        return value
    }

    // O(1)
    @discardableResult
    public mutating func popBack() -> Element? {
        guard let t = tail else { return nil }
        let value = t.value

        let prev = t.prev
        prev?.next = nil
        tail = prev

        if tail == nil { head = nil }
        t.prev = nil
        return value
    }

    // Insert new value AFTER a node (O(1))
    public mutating func insert(_ value: Element, after node: Node) {
        if node === tail {
            append(value)
            return
        }

        let new = Node(value)
        let next = node.next

        new.prev = node
        new.next = next

        node.next = new
        next?.prev = new
    }

    // Insert new value BEFORE a node (O(1))
    public mutating func insert(_ value: Element, before node: Node) {
        if node === head {
            pushFront(value)
            return
        }

        let new = Node(value)
        let prev = node.prev

        new.next = node
        new.prev = prev

        prev?.next = new
        node.prev = new
    }

    // Remove a specific node (O(1)) if you already have a reference to it
    @discardableResult
    public mutating func remove(_ node: Node) -> Element {
        if node === head { return popFront()! }
        if node === tail { return popBack()! }

        let prev = node.prev
        let next = node.next

        prev?.next = next
        next?.prev = prev

        node.prev = nil
        node.next = nil
        return node.value
    }

    // Find first node matching predicate (O(n))
    public func firstNode(where predicate: (Element) -> Bool) -> Node? {
        var cur = head
        while let node = cur {
            if predicate(node.value) { return node }
            cur = node.next
        }
        return nil
    }
}

// MARK: - Iteration

extension DoublyLinkedList: Sequence {
    public struct Iterator: IteratorProtocol {
        private var current: Node?
        fileprivate init(_ start: Node?) { self.current = start }

        public mutating func next() -> Element? {
            guard let node = current else { return nil }
            current = node.next
            return node.value
        }
    }

    public func makeIterator() -> Iterator { Iterator(head) }
}

// MARK: - Convenience (debug)

extension DoublyLinkedList: CustomStringConvertible {
    public var description: String {
        var parts: [String] = []
        var cur = head
        while let node = cur {
            parts.append(String(describing: node.value))
            cur = node.next
        }
        return parts.joined(separator: " <-> ")
    }
}
