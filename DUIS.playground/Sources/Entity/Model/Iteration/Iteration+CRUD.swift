
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
    public mutating func addCard(card: Card) -> Bool {// throws
//        if(self.getPoints() > 35) {
//         throw BoardError.notEnoughColumns("the points are more than standard 35 points")
//        } else {
        self.cards.append(card)
        //}
        return true
    }

}
