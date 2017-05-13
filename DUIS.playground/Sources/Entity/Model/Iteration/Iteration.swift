
protocol SprintIteration {
    mutating func addCard(card: Card) -> Bool
    func getCard(status: ColumnStatus) -> [Card]
    func velocity() -> Int
    mutating func move(card: Card, toColumn: Column ) -> Bool
    mutating func undoLastMove() -> Bool
}
