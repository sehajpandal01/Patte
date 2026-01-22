import SwiftUI
struct EndGameView: View {
    let loser: String
    let onRestart: () -> Void
    var body: some View {
        VStack {
            Text("\(loser) lost the game!")
                .font(.largeTitle)
                .padding()

            Button("Restart") {
                onRestart()
            }
            .padding()
        }
    }
}
