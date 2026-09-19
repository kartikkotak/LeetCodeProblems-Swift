final class AXNode {
    let id: String
    let label: String?
    let isHidden: Bool
    let isAccessibilityElement: Bool
    let children: [AXNode]
    
    init(
        id: String,
        label: String?,
        isHidden: Bool = false,
        isAccessibilityElement: Bool = false,
        children: [AXNode] = []
    ) {
        self.id = id
        self.label = label
        self.isHidden = isHidden
        self.isAccessibilityElement = isAccessibilityElement
        self.children = children
    }
}


func accessibleElements(from root: AXNode?) -> [AXNode] {
    guard let root else { return [] }
    var accessibilityElements: [AXNode] = []
    
    dfs(root)
    
    func dfs(node: AXNode) {
        guard !node.isHidden else { return }
        
        guard !node.isAccessibilityElement else {
            accessibilityElements.append(node)
            return
        }
        
        for child in node.children {
            dfs(node: child)
        }
    }
    
    return accessibilityElements
}
// Time: O(n)
// Space: O(h), O(n) worst case


