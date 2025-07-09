import SwiftUI

@main
struct PatteApp: App {
    @StateObject var gameState = GameState()

    var body: some Scene {
        WindowGroup {
            if gameState.gameEnded {
                EndGameView(loser: gameState.loserName ?? "Someone") {
                    gameState.resetGame()
                }
            } else if gameState.gameStarted {
                GameView(gameState: gameState)
            } else {
                StartGameView(gameState: gameState)
            }
        }
    }
}