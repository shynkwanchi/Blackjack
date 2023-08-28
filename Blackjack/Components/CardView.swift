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

struct CardView: View {
    var card: Card
    var hand: PlayerType
    var stayed: Bool
    let duration: CGFloat = 0.25
    
    @State private var backDegree: Double = 0.0
    @State private var frontDegree: Double = -90.0
    
    func flip(isFlipped: Bool) {
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
        // If player / dealer stays, the card automatically flips
        if stayed {
            FlipView(frontView: card.image, backView: "card-back", frontDegree: $frontDegree, backDegree: $backDegree)
            .onAppear {
                flip(isFlipped: true)
            }
        }
        // Otherwise, if the card belongs to the player, player can flip it with a tap
        else {
            FlipView(frontView: card.image, backView: "card-back", frontDegree: $frontDegree, backDegree: $backDegree)
            .onTapGesture {
                if hand == .player {
                    flip(isFlipped: true)
                }
            }
        }
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: Card(suit: .spade, rank: .ace), hand: .player, stayed: true)
    }
}
