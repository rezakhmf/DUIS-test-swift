//: Playground - noun: a place where people can play

import Foundation


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




