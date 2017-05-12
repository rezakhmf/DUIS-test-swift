//: Playground - noun: a place where people can play

import Foundation

protocol SprintCard {
    var title: String  { get set }
    var description: String { get set }
    var estimatedPoint: Int { get set }
    var column: Column? { get set }
}

protocol SprintColumn {
    // check to have at least two column with failable iniitilizer
    // that should "strating" an "done" at least
    var name: String { get set }
    var status: ColumnStatus { get set }
}
protocol SprintIteration {
    mutating func addCard(card: Card) -> Bool
    func getCard(status: ColumnStatus) -> [Card]
    func velocity() -> Int
    mutating func move(card: Card, toColumn: Column ) -> Bool
    mutating func undoLastMove() -> Bool
}

protocol SprintBoard {
    var columns: [Column] {get set }
}

enum ColumnStatus {
    case backLog
    case notStarted
    case starting
    case readyForTest
    case inTest
    case pmVerification
    case done
}



struct Card: SprintCard, Equatable, Hashable {
    
    internal var title: String
    internal var description: String
    internal var estimatedPoint: Int
    internal var column: Column?
    
    var hashValue: Int {
        return title.hashValue +
            description.hashValue +
            estimatedPoint.hashValue
    }
    
    init( title: String, description: String, estimatedPoint: Int) {
        self.title = title
        self.description = description
        self.estimatedPoint = estimatedPoint
    }
    
    static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.title == rhs.title
            && lhs.description == rhs.description
            && lhs.estimatedPoint == rhs.estimatedPoint
    }
    
    
    
}


struct Column: SprintColumn {
    internal var status: ColumnStatus
    internal var name: String
}



struct Iteration: SprintIteration {
    
    var cards: [Card] = [Card]()
    var cardMovement: [Int:[Column]] = [Int:[Column]]()
    var currentCard:Int = 0
    
    internal mutating func addCard(card: Card) -> Bool {
        self.cards.append(card)
        return true
    }
    
    internal func getCard(status: ColumnStatus) -> [Card] {
        
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
    
    internal func velocity() -> Int {
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
    
    internal mutating func move(card: Card, toColumn: Column) -> Bool {
        
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
    
    internal mutating func undoLastMove() -> Bool {
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


struct Board: SprintBoard {
    
    internal var columns: [Column]
    
}


let noStartedColumn = Column(status: .notStarted, name: "need Dev to pick")
let devColumn = Column(status: .notStarted, name: "need Dev to pick")
let readyForTestColumn = Column(status: .readyForTest, name: "ready for test")
let testingByQAColumn = Column(status: .inTest, name: "testing by QA")
let pmVerificationColumn = Column(status: .pmVerification, name: "Project Manager, please verify it")
let doneColumn = Column(status: .done, name: "Task is completed")

let columns: [Column] = [
    noStartedColumn,
    devColumn,
    readyForTestColumn,
    testingByQAColumn,
    pmVerificationColumn,
    doneColumn
]

var firstCard = Card(title: "off screen pittfall", description: "profile the off screen elements", estimatedPoint: 3)
firstCard.column = testingByQAColumn

var secondCard = Card(title: "reference cycle", description: "profile memmory referect cycle", estimatedPoint: 5)
secondCard.column = devColumn

var thirdCard = Card(title: "color blending pittfall", description: "profile the color blending pitfall", estimatedPoint: 2)
thirdCard.column = doneColumn


let board  = Board(columns: columns)

var iteration = Iteration()

iteration.addCard(card: firstCard)
iteration.addCard(card: secondCard)
iteration.addCard(card: thirdCard)

iteration.velocity()

print(iteration.getCard(status: .done))
iteration.move(card: thirdCard, toColumn: readyForTestColumn)
print("####################################")
print(iteration.getCard(status: .readyForTest))
iteration.undoLastMove()
print("%%%%%%%%%%%resutl%%%%%%%%%%%")
print(iteration.getCard(status: .done))







