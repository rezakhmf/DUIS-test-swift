
public struct Card: SprintCard, Equatable, Hashable {
        
      var title: String
      var description: String
      var estimatedPoint: Int
      public var column: Column?
    
    public init( title: String, description: String, estimatedPoint: Int) {
        self.title = title
        self.description = description
        self.estimatedPoint = estimatedPoint
    }
    
    public var hashValue: Int {
        return title.hashValue +
            description.hashValue +
            estimatedPoint.hashValue
    }
    
    
    public static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.title == rhs.title
            && lhs.description == rhs.description
            && lhs.estimatedPoint == rhs.estimatedPoint
    }
    
    
    
}
