//
//  LinkedList.swift
//
//  Created by Kartik Kotak on 2/16/26.
//

// MARK: - Singly Linked List

public struct LinkedList<Element> {
    public final class Node {
        public var value: Element
        public var next: Node?
        
        public init(_ value: Element, next: Node? = nil) {
            self.value = value
            self.next = next
        }
    }
    
    private(set) public var head: Node?
    private(set) public var tail: Node?
    
    public init() {}
    
    public var isEmpty: Bool { head == nil }
    
    // O(1)
    public mutating func pushFront(_ value: Element) {
        let new = Node(value, next: head)
        head = new
        if tail == nil { tail = new }
    }
    
    // O(1)
    public mutating func append(_ value: Element) {
        let new = Node(value)
        if let tail = tail {
            tail.next = new
            self.tail = new
        } else {
            head = new
            tail = new
        }
    }
    
    // Removes and returns the first element, O(1)
    @discardableResult
    public mutating func popFront() -> Element? {
        guard let h = head else { return nil }
        head = h.next
        if head == nil { tail = nil }
        return h.value
    }
    
    // Find first node matching predicate, O(n)
    public func firstNode(where predicate: (Element) -> Bool) -> Node? {
        var cur = head
        while let node = cur {
            if predicate(node.value) { return node }
            cur = node.next
        }
        return nil
    }
    
    // Remove the node after a given node, O(1)
    @discardableResult
    public mutating func remove(after node: Node) -> Element? {
        guard let target = node.next else { return nil }
        node.next = target.next
        if target === tail { tail = node }
        return target.value
    }
    
    // Convenience: remove first occurrence of value (when Element is Equatable)
    public mutating func removeFirst(_ value: Element) where Element: Equatable {
        guard let h = head else { return }
        if h.value == value {
            _ = popFront()
            return
        }
        
        var prev: Node? = head
        var cur: Node? = head?.next
        
        while let node = cur {
            if node.value == value {
                prev?.next = node.next
                if node === tail { tail = prev }
                return
            }
            prev = cur
            cur = node.next
        }
    }
}

// MARK: - LinkedList iteration

extension LinkedList: Sequence {
    public struct Iterator: IteratorProtocol {
        private var current: Node?
        
        fileprivate init(start: Node?) { self.current = start }
        
        public mutating func next() -> Element? {
            guard let node = current else { return nil }
            current = node.next
            return node.value
        }
    }
    
    public func makeIterator() -> Iterator {
        Iterator(start: head)
    }
}

