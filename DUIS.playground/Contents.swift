import Foundation
import XCTest

// MARK: - columns
let noStartedColumn = Column(status: .notStarted, name: "need Dev to pick")
let devColumn = Column(status: .notStarted, name: "need Dev to pick")
let readyForTestColumn = Column(status: .readyForTest, name: "ready for test")
let testingByQAColumn = Column(status: .inTest, name: "testing by QA")
let pmVerificationColumn = Column(status: .pmVerification, name: "Project Manager, please verify it")
let doneColumn = Column(status: .done, name: "Task is completed")

// MARK: - columns array
let columns: [Column] = [
    noStartedColumn,
    devColumn,
    readyForTestColumn,
    testingByQAColumn,
    pmVerificationColumn,
    doneColumn
]

// MARK: - cards

var firstCard = Card(title: "off screen pittfall", description: "profile the off screen elements", estimatedPoint: 3)
firstCard.column = testingByQAColumn

var secondCard = Card(title: "reference cycle", description: "profile memmory referect cycle", estimatedPoint: 5)
secondCard.column = devColumn

var thirdCard = Card(title: "color blending pittfall", description: "profile the color blending pitfall", estimatedPoint: 2)
thirdCard.column = doneColumn


var iteration = Iteration()
// MARK: - add cards
iteration.addCard(card: firstCard)
iteration.addCard(card: secondCard)
iteration.addCard(card: thirdCard)
// MARK: - get velocity
iteration.velocity()
// MARK: - find card based on status
iteration.getCard(status: .done)
// MARK: - move card
iteration.move(card: thirdCard, toColumn: readyForTestColumn)
// MARK: - get card
iteration.getCard(status: .readyForTest)
// MARK: - undo last move
iteration.undoLastMove()
// MARK: - get card from moved column
iteration.getCard(status: .done)

let board  = try? Board(iteration: iteration, columns: columns)



// MARK: - tests scenarios
func testVelocity() {
    XCTAssertEqual(1, iteration.velocity(), "just one card should be one done")
}

func testIterrationGetCardShouldReturnDoneSattus() {
  let cards = iteration.getCard(status: .done)
  if let cardColumnStatus = cards[0].column {
        XCTAssertEqual(ColumnStatus.done, cardColumnStatus.status, "should be in done column")
    }
}

func testIterrationGetCardShouldReturnDoneColumnName() {
    let cards = iteration.getCard(status: .done)
     if let cardColumnStatus = cards[0].column {
      XCTAssertEqual("Task is completed", cardColumnStatus.name, "should be in done column's name")
    }
}
// MARK: - tests runner
testVelocity()
testIterrationGetCardShouldReturnDoneSattus()
testIterrationGetCardShouldReturnDoneColumnName()



