
extension Iteration {
    public func getCard(status: ColumnStatus) -> [Card] {
        
        var candidateCards: [Card] = [Card]()
        
        guard cards.count > 0 else {
            print("no cards are defined")
            return  [Card]()
        }
        
        for card in cards {
            if let columnCard = card.column {
                if columnCard.status == status {
                    candidateCards.append(card)
                }
            }
            
        }
        return candidateCards
        
    }
    
}

extension Iteration {
    
    public mutating func add(listOfCards: [Card]) throws -> Bool {
        
        for card in listOfCards {
            if(self.points() <= 35) {
                self.cards.append(card)
            } else {
                throw BoardError.moreThanBoardCapicity("the points are more than standard board capacity (35 points) ")
                print("the points are more than standard board capacity (35 points) ")
                return false
            }
        }
       return true
    }
}
