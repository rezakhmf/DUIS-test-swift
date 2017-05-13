
extension Iteration {
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

}

extension Iteration {
    public mutating func addCard(card: Card) -> Bool {
        self.cards.append(card)
        return true
    }

}
