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
        ZStack {
            Image("\(card.suit.rawValue) \(card.rank.rawValue)")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .rotation3DEffect(.degrees(frontDegree), axis: (x: 0, y: 1, z: 0))
            Image("card-back")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .rotation3DEffect(.degrees(backDegree), axis: (x: 0, y: 1, z: 0))
        }
        .onTapGesture {
            if hand == .player {
                flip(isFlipped: true)
            }
        }
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: Card(suit: .spade, rank: .ace), hand: .player)
    }
}
