/**
 Given a 2D grid of "1" and "0", count the number of islands. An island is connected horizontally or vertically.
 
 [
 ["1","1","0","0"],
 ["1","0","0","1"],
 ["0","0","1","1"]
 ]
 */

func numIslands(_ grid: [[Character]]) -> Int {
    guard grid.count > 0 else { return 0 }
    
    var grid = grid
    var islands: Int = 0
    
    func dfs(from x: Int, y: Int) {
        guard x >= 0, x < grid.count, y >= 0, y < grid[x].count else {
            return
        }
        
        guard grid[x][y] == "1" else {
            return
        }
        
        grid[x][y] = "0"
        
        dfs(from: x+1, y: y)
        dfs(from: x-1, y: y)
        dfs(from: x, y: y-1)
        dfs(from: x, y: y+1)
    }
    
    for row in 0..<grid.count {
        for column in 0..<grid[row].count {
            if grid[row][column] == "1" {
                islands += 1
                dfs(from: row, y: column)
            }
        }
    }
    
    return islands
}
