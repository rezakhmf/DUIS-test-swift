
public struct Board: SprintBoard {
    
   public var columns: [Column]
    public var iteration: Iteration

    public init?(iteration: Iteration, columns: [Column]) throws{
        if columns.count > 1 {
            self.iteration = iteration
            self.columns = columns
        } else {
            throw BoardError.notEnoughColumns("the number of columns should be at least 2 to have a board")
        }
    }
    
}

