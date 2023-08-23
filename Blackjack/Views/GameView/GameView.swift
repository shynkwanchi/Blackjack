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
    private var userVM: UserViewModel
    
    // Properties for the player and the dealer
    @State private var playerHand: [CardModel] = []
    @State private var dealerHand: [CardModel] = []
    
    // The number of cards that player and dealer can draw for each round
    @State private var currentPlayerHits: Int = 3
    @State private var currentDealerHits: Int = 3
    
    // Properties for game
    @Binding var difficulty: Difficulty
    @Binding var resume: Bool
    @Binding var currentUser: String
    @State private var showRegister: Bool = false
    @State private var currentRound: Int = 1
    @State private var showRoundResult: Bool = false
    @State private var showGameResult: Bool = false
    
    init(userVM: UserViewModel, difficulty: Binding<Difficulty>, resume: Binding<Bool>, currentUser: Binding<String>) {
        self.userVM = userVM
        self._difficulty = difficulty
        self._resume = resume
        self._currentUser = currentUser
        
        if (self.resume) {
            _showRegister = State(initialValue: false)
        }
        else {
            _showRegister = State(initialValue: true)
        }
    }
    
    var body: some View {
        ZStack {
            VStack {
                ZStack {
                    Card(card: CardModel(suit: .club, rank: .king), hand: .dealer)
                        .offset(x: -30)
                    Card(card: CardModel(suit: .heart, rank: .queen), hand: .dealer)
                        .offset(x: 30)
                }
                .offset(y: 40)
                                
                ZStack {
                    Card(card: CardModel(suit: .diamond, rank: .ace), hand: .player)
                        .offset(x: -30)
                    Card(card: CardModel(suit: .spade, rank: .jack), hand: .player)
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
                        resume = true
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
                GameStats(icon: "laptopcomputer", money: 5000, score: 0)
                
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
            
            
            if (showRegister) {     // Show registration modal when user wants to register a username
                RegistrationModal(userVM: userVM, dismiss: dismiss, showRegister: $showRegister, currentUser: $currentUser)
            }
        }
        .background(Background())
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
