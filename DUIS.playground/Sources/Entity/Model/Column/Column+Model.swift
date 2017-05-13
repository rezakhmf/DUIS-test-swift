
public struct Column: SprintColumn {
    
    
    
    var status: ColumnStatus
    var name: String
    
    public init(status: ColumnStatus, name: String) {
        self.name = name
        self.status = status
    }
}
