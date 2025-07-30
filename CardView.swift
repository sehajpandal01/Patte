import SwiftUI
struct CardView: View {
    let card: Card

    var body: some View {
        Text(card.description)
            .font(.title2)
            .frame(width: 50, height: 70)
            .background(Color.white)
            .cornerRadius(8)
            .shadow(radius: 2)
    }
}
