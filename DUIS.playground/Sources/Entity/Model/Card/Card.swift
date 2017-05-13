
protocol SprintCard {
    var title: String  { get set }
    var description: String { get set }
    var estimatedPoint: Int { get set }
    var column: Column? { get set }
}


public enum ColumnStatus {
    case backLog
    case notStarted
    case starting
    case readyForTest
    case inTest
    case pmVerification
    case done
}
