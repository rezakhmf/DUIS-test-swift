
public struct Iteration: SprintIteration {
    
    public init() {}
    
    var cards: [Card] = [Card]()
    var cardMovement: [Int:[Column]] = [Int:[Column]]()
    var currentCard:Int = 0
    
     public mutating func addCard(card: Card) -> Bool {
        self.cards.append(card)
        return true
    }
    
     public func getCard(status: ColumnStatus) -> [Card] {
        
        var doneCards: [Card] = [Card]()
        
        guard cards.count > 0 else {
            print("no cards are defined")
            return  [Card]()
        }
        
        for card in cards {
            if let columnCard = card.column {
                if columnCard.status == status {
                    doneCards.append(card)
                }
            }
            
        }
        return doneCards
        
    }
    
     public func velocity() -> Int {
        var velocity: Int = 0
        for card in cards {
            if let cardColum = card.column {
                if (cardColum.status == .done) {
                    velocity = velocity + 1;
                }
            }
        }
        
        return velocity
    }
    
     public mutating func move(card: Card, toColumn: Column) -> Bool {
        
        for i in 0...cards.count {
            if(cards[i] == card) {
                if var cardMovements = cardMovement[cards[i].hashValue] {
                    self.currentCard = cards[i].hashValue
                    cardMovements.append(toColumn)
                    cardMovement[cards[i].hashValue] = cardMovements
                } else {
                    var freshMovementArray: [Column] = [Column]()
                    // this need to be fixed for optional value
                    freshMovementArray.append((cards[i].column)!)
                    freshMovementArray.append(toColumn)
                    cardMovement[cards[i].hashValue]  = freshMovementArray
                    self.currentCard = cards[i].hashValue
                }
                cards[i].column = toColumn
                return true
            }
        }
        
        return false
    }
    
     public mutating func undoLastMove() -> Bool {
        if var cardMovements = cardMovement[self.currentCard] {
            cardMovements.removeLast()
            for i in 0...cards.count {
                if(cards[i].hashValue == self.currentCard) {
                    cards[i].column? = cardMovements[cardMovements.count - 1]
                    return true
                }
            }
            
        }
        return false
    }
    
}
