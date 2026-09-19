/**
 
 */

final private class Node {
    var val: Int
    var neighbors: [Node]
    
    init(_ val: Int) {
        self.val = val
        self.neighbors = []
    }
}

final class GraphCloner {
    private var visited: [ObjectIdentifier: Node] = [:]
    
    func cloneGraph(_ node: Node?) -> Node? {
        guard let node else { return nil }
        
        let id = ObjectIdentifier(node)
        
        if let cloned = visited[id] {
            return cloned
        }
        
        let clone = Node(node.val)
        visited[id] = clone
        
        for neighbor in node.neighbors {
            if let clonedNeighbor = cloneGraph(neighbor) {
                clone.neighbors.append(clonedNeighbor)
            }
        }
        
        return clone
    }
}

// Time: O(V + E)
// Space: O(V)
