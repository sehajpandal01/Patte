import Foundation
class GameState: ObservableObject {
    @Published var players: [Player] = []
    @Published var currentPlayerIndex = 0
    @Published var playedCards: [(Player, Card)] = []
    @Published var gameStarted = false
    @Published var gameEnded = false
    @Published var loserName: String?
    private var deck = Deck()
    private var leadSuit: String?
    func startGame(with names: [String]) {
        players = names.map { Player(name: $0, hand: []) }
        deck.deal(to: &players)
        currentPlayerIndex = 0
        playedCards = []
        leadSuit = nil
        gameStarted = true
        gameEnded = false
    }
    func play(card: Card) {
        guard !gameEnded else { return }
        let currentPlayer = players[currentPlayerIndex]
        if leadSuit == nil {
            leadSuit = card.suit
        }
        players[currentPlayerIndex].playCard(card)
        playedCards.append((currentPlayer, card))

        if playedCards.count == players.count {
            endRound()
        } else {
            currentPlayerIndex = (currentPlayerIndex + 1) % players.count
        }
    }
    func endRound() {
        let suitCards = playedCards.filter { $0.1.suit == leadSuit }
        if let losingPlay = suitCards.max(by: { $0.1.value < $1.1.value }) {
            if let loserIndex = players.firstIndex(where: { $0.id == losingPlay.0.id }) {
                players[loserIndex].collectedCards.append(contentsOf: playedCards.map { $0.1 })
            }
        }

        leadSuit = nil
        playedCards = []
        currentPlayerIndex = (currentPlayerIndex + 1) % players.count

        if players.contains(where: { $0.hand.isEmpty }) {
            endGame()
        }
    }

    func endGame() {
        if let loser = players.max(by: { $0.collectedCards.count < $1.collectedCards.count }) {
            loserName = loser.name
        }
        gameEnded = true
    }

    func resetGame() {
        players.removeAll()
        gameStarted = false
        gameEnded = false
        loserName = nil
    }
}
