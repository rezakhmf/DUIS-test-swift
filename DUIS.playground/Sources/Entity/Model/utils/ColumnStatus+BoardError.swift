public enum ColumnStatus {
    case backLog
    case notStarted
    case starting
    case readyForTest
    case inTest
    case pmVerification
    case done
}

enum BoardError: Error {
    
    case notEnoughColumns(String)
    case moreThanBoardCapicity(String)
}
