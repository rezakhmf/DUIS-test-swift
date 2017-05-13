
public struct Column: SprintColumn {
    
   public var status: ColumnStatus
   public var name: String
    
    public init(status: ColumnStatus, name: String) {
        self.name = name
        self.status = status
    }
}

