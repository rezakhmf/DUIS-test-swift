
public struct Iteration: SprintIteration {
    
    public init() {}
    
    var cards: [Card] = [Card]()
    var cardMovement: [Int:[Column]] = [Int:[Column]]()
    var currentCard:Int = 0
    
}
