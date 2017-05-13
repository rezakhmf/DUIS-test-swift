
protocol SprintColumn {
    // check to have at least two column with failable iniitilizer
    // that should "strating" an "done" at least
    var name: String { get set }
    var status: ColumnStatus { get set }
}
