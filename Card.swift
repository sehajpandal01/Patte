import Foundation
struct Card: Identifiable, Equatable {
    let id = UUID()
    let suit: String
    let rank: String
    let value: Int
    var description: String {
        return "\(rank)\(suit)"
    }
}
