import SwiftUI
struct StartGameView: View {
    @ObservedObject var gameState: GameState
    @State private var playerNames = ["Amrit", "Simran", "Raj"]
    var body: some View {
        VStack {
            Text("Welcome to Patte – Bhabi Mode")
                .font(.largeTitle)
                .padding()
            ForEach(0..<playerNames.count, id: \.self) { i in
                TextField("Player \(i + 1)", text: $playerNames[i])
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
            }
            Button("Start Game") {
                gameState.startGame(with: playerNames)
            }
            .padding()
        }
    }
}
