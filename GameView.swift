import SwiftUI
struct GameView: View {
    @ObservedObject var gameState: GameState
    var body: some View {
        VStack {
            Text("Patte – Bhabi Mode")
                .font(.title)
                .padding()
            Text("Current Player: \(gameState.players[gameState.currentPlayerIndex].name)")
                .font(.subheadline)

            if !gameState.playedCards.isEmpty {
                HStack {
                    ForEach(gameState.playedCards, id: \.1.id) { entry in
                        VStack {
                            CardView(card: entry.1)
                            Text(entry.0.name).font(.caption)
                        }
                    }
                }
                .padding(.vertical)
            }

            ScrollView {
                ForEach(gameState.players) { player in
                    PlayerHandView(player: player,
                                   isCurrent: gameState.players[gameState.currentPlayerIndex].id == player.id,
                                   onCardPlayed: gameState.play)
                }
            }
        }
    }
}
