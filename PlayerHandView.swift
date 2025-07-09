import SwiftUI

struct PlayerHandView: View {
    let player: Player
    let isCurrent: Bool
    let onCardPlayed: (Card) -> Void

    var body: some View {
        VStack {
            Text(player.name)
                .font(.headline)
                .foregroundColor(isCurrent ? .blue : .primary)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(player.hand) { card in
                        CardView(card: card)
                            .onTapGesture {
                                if isCurrent {
                                    onCardPlayed(card)
                                }
                            }
                    }
                }
            }
            .padding(.horizontal)
            .background(isCurrent ? Color.yellow.opacity(0.3) : Color.clear)
        }
    }
}