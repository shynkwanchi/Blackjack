/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 2
  Author: Nguyen Quang Duy
  ID: 3877991
  Created  date: 09/08/2023
  Last modified: To be updated
  Acknowledgement: None
*/

import SwiftUI

struct GameView: View {
    @Environment(\.dismiss) var dismiss
//    var cardVM: CardViewModel
//    var cards: [CardModel] = []
    
    // Properties for player and the opponent
    @State private var opponentMoney: Int = 5000
    @State private var opponentScore: Int = 0
    
    // Properties for game
    @State private var currentRound: Int = 1
    @State private var playerStay: Bool = false
    @State private var opponentStay: Bool = false
    @State private var showRoundResult: Bool = false
    @State private var showGameResult: Bool = false
    
//    init() {
//        self.cardVM = CardViewModel()
//        self.cards = cardVM.cards
//        print(cards)
//    }
    
    var body: some View {
        ZStack {
            VStack {
                ZStack {
                    Card(card: CardModel(suit: .club, rank: .king), hand: .opponent)
                        .offset(x: -30)
                    Card(card: CardModel(suit: .heart, rank: .queen), hand: .opponent)
                        .offset(x: 30)
                }
                .offset(y: 40)
                                
                ZStack {
                    Card(card: CardModel(suit: .diamond, rank: .ace), hand: .you)
                        .offset(x: -30)
                    Card(card: CardModel(suit: .spade, rank: .jack), hand: .you)
                        .offset(x: 30)
                }
                .offset(y: -35)
            }
            
            VStack() {
                VStack {
                    Text("20 POINTS")
                        .font(Font.custom("BeVietnamPro-Bold", size: 30))
                }
                .offset(y: -20)
                
                VStack {
                    Text("BLACKJACK")
                        .font(Font.custom("BeVietnamPro-Bold", size: 30))
                }
                .offset(y: 25)
            }
            .modifier(TextModifier())
            
            VStack{
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "arrowshape.backward.fill")
                            .iconModidifer()
                            .frame(width: 30)
                    }
                    .buttonStyle(CustomButton())
                    Spacer()
                    
                    Text("ROUND \(currentRound)")
                        .font(Font.custom("BeVietnamPro-Bold", size: 30))
                        .tracking(2.5)
                        .modifier(TextModifier())
                    Spacer()
                    
                    NavigationButton(destinationView: HowToPlayView(), icon: "questionmark", width: 30)
                        .buttonStyle(CustomButton())
                }
                .padding(.bottom, 5.0)
                
                // The opponent's stats
                GameStats(icon: "laptopcomputer", money: opponentMoney, score: opponentScore)
                
                Spacer()
                
                // The player's stats
                GameStats(icon: "person.fill", money: 500, score: 21)
                
                HStack(spacing: 40.0) {
                    Button {
                        
                    } label: {
                        Text("HIT")
                            .font(Font.custom("BeVietnamPro-Medium", size: 24))
                            .tracking(2.5)
                            .frame(width: 120, height: 24)
                            .modifier(TextModifier())
                    }
                    .buttonStyle(CustomButton())
                    
                    Button {
                        self.playerStay = true
                    } label: {
                        Text("STAY")
                            .font(Font.custom("BeVietnamPro-Medium", size: 24))
                            .tracking(2.5)
                            .frame(width: 120, height: 24)
                            .modifier(TextModifier())
                    }
                    .buttonStyle(CustomButton())
                }
                .padding(.top, 5.0)
            }
            .padding(.horizontal, 10.0)
        }
        .background(Background())
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
