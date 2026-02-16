//
//  Queue.swift
//  LeetCodeProblems
//
//  Created by Kartik Kotak on 2/16/26.
//

import Foundation

/// Queue - FIFO (First in first out)
public protocol Queue {
    associatedtype Element
    var isEmpty: Bool { get }
    var peek: Element? { get }
    var count: Int { get }
    
    mutating func enqueue(_ element: Element)
    @discardableResult
    mutating func dequeue() -> Element?
}

/// QueueStack uses two stack to provide amortized O(1) for remove operation
public struct QueueStack<T>: Queue {
    
    private var inbox: [T] = []
    private var outbox: [T] = []
    
    public typealias Element = T
    
    public var isEmpty: Bool { return inbox.isEmpty && outbox.isEmpty }
    public var count: Int { return inbox.count + outbox.count }
    public var peek: T? { return outbox.last ?? inbox.last }
    
    public mutating func enqueue(_ element: T) {
        inbox.append(element)
    }
    
    public mutating func dequeue() -> T? {
        guard outbox.isEmpty else {
            return outbox.popLast()
        }
        
        outbox = inbox.reversed()
        inbox.removeAll(keepingCapacity: true)
        
        return outbox.popLast()
    }
}


