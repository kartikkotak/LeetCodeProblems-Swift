//
//  Stack.swift
//
//  Created by Kartik Kotak on 2/16/26.
//

public struct Stack<Element> {
    private var storage: [Element] = []
    
    public init(storage: [Element]) {
        self.storage = storage
    }
    
    public var isEmpty: Bool { storage.isEmpty }
    public var count: Int { storage.count }
    public var peek: Element? { storage.last }
    
    public mutating func push(_ element: Element) {
        storage.append(element)
    }
    
    @discardableResult
    public mutating func pop() -> Element? {
        return storage.popLast()
    }
    
    public mutating func removeAll(keepingCapacity: Bool = false) {
        storage.removeAll(keepingCapacity: keepingCapacity)
    }
}

extension Stack: ExpressibleByArrayLiteral {
    public init(arrayLiteral elements: Element...) {
        storage = elements
    }
}

extension Stack: CustomStringConvertible {
    public var description: String {
        """
        ---top---
        \(storage.map({"\($0)"}).reversed().joined(separator: "\n"))
        """
    }
}
