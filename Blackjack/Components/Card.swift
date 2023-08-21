/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 2
  Author: Nguyen Quang Duy
  ID: 3877991
  Created  date: 20/08/2023
  Last modified: To be updated
  Acknowledgement: None
*/

import SwiftUI

struct Card: View {
    var card: CardModel
    var hand: Player
    let duration: CGFloat = 0.25
    
    @State var isFlipped: Bool = false
    @State private var backDegree: Double = 0.0
    @State private var frontDegree: Double = -90.0
    
    func flip() {
        isFlipped = !isFlipped
        if isFlipped {
            withAnimation(.linear(duration: duration)) {
                backDegree = 90.0
            }
            withAnimation(.linear(duration: duration).delay(duration)) {
                frontDegree = 0
            }
        }
    }
    
    var body: some View {
        ZStack {
            Image("\(card.suit.rawValue) \(card.rank.rawValue)")
                .resizable()
                .scaledToFit()
                .scaleEffect(0.5)
                .rotation3DEffect(.degrees(frontDegree), axis: (x: 0, y: 1, z: 0))
            Image("card-back")
                .resizable()
                .scaledToFit()
                .scaleEffect(0.5)
                .rotation3DEffect(.degrees(backDegree), axis: (x: 0, y: 1, z: 0))
        }
        .onTapGesture {
            if (hand == .you) {
                flip()
            }
        }
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        Card(card: CardModel(suit: .spade, rank: .ace), hand: .you)
    }
}
