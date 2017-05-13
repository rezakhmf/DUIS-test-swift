
protocol SprintIteration {
    mutating func add(listOfCards: [Card]) throws -> Bool
    func getCard(status: ColumnStatus) -> [Card]
    func velocity() -> Int
    func points() -> Int
    mutating func move(card: Card, toColumn: Column ) -> Bool
    mutating func undoLastMove() -> Bool
}
