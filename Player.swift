import Foundation
struct Player: Identifiable {
    let id = UUID()
    let name: String
    var hand: [Card]
    var collectedCards: [Card] = []
    mutating func playCard(_ card: Card) {
        hand.removeAll { $0 == card }
    }
}
