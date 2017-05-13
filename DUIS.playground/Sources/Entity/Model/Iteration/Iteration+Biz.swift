
extension Iteration {
    // MARK: - velocity
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
}

extension Iteration {
    // MARK: - move
    public mutating func move(card: Card, toColumn: Column) -> Bool {
        
        for i in 0...cards.count {
            if(cards[i] == card) {
                if var cardMovements = cardMovement[cards[i].hashValue] {
                    self.currentCard = cards[i].hashValue
                    cardMovements.append(toColumn)
                    cardMovement[cards[i].hashValue] = cardMovements
                } else {
                    if let movedCard = cards[i].column {
                        var freshMovements: [Column] = [Column]()
                        freshMovements.append(movedCard)
                        freshMovements.append(toColumn)
                        cardMovement[cards[i].hashValue]  = freshMovements
                        self.currentCard = cards[i].hashValue
                    }
                }
                cards[i].column = toColumn
                return true
            }
        }
        
        return false
    }
}

extension Iteration {
    // MARK: - undo last move
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

extension Iteration {
     // MARK: - get iteration points
    public func getPoints() -> Int {
        var points = 0
        for i in 0...cards.count {
            points = points + cards[i].estimatedPoint
        }
        return points
    }
}
