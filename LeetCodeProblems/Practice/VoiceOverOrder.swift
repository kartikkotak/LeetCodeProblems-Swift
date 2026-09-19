/**
 You are given visible UI elements with frames. Return the order VoiceOver should read them: top-to-bottom, then left-to-right.
 
 Rules:
 
 - Skip hidden elements.
 - Skip elements with nil labels.
 - Sort top-to-bottom by y.
 - If two elements are on the same row, sort left-to-right by x.
 */

struct Rect {
    let x: Int
    let y: Int
    let width: Int
    let height: Int
}

struct UIElement {
    let id: String
    let label: String?
    let frame: Rect
    let isHidden: Bool
    let isEnabled: Bool
}

func voiceOverOrder(_ elements: [UIElement]) -> [UIElement] {
    var sorted: [UIElement] = elements.compactMap {
        if let label = $0.label {
            return $0.isHidden ? nil else $0
                }
        return nil
    }.sorted { e1, e2 in
        if e1.frame.y == e2.frame.y {
            e1.frame.x < e2.frame.x
        } else {
            e1.frame.y < e2.frame.y
        }
    }
    
    return sorted
}


// Better solution with row tolerance follow up:

func voiceOverOrder(
    _ elements: [UIElement],
    rowTolerance: Int = 10
) -> [UIElement] {
    elements
        .filter { !$0.isHidden && $0.label != nil }
        .sorted { e1, e2 in
            let sameRow = abs(e1.frame.y - e2.frame.y) <= rowTolerance
            
            if sameRow {
                return e1.frame.x < e2.frame.x
            }
            
            return e1.frame.y < e2.frame.y
        }
}
