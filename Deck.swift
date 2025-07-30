import Foundation

class Deck {
    private(set) var cards: [Card] = []

    init() {
        reset()
    }

    func reset() {
        let suits = ["♠", "♥", "♦", "♣"]
        let ranks = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
        let values = Array(1...13)
        cards = []

        for (i, rank) in ranks.enumerated() {
            for suit in suits {
                cards.append(Card(suit: suit, rank: rank, value: values[i]))
            }
        }

        cards.shuffle()
    }

    func deal(to players: inout [Player]) {
        reset()
        var index = 0
        while !cards.isEmpty {
            let card = cards.removeFirst()
            players[index % players.count].hand.append(card)
            index += 1
        }
    }
}
