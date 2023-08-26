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
    @StateObject private var cardVM: CardViewModel = CardViewModel()
    
    // Properties for game
    @Binding var difficulty: Difficulty
    @Binding var resume: Bool
    @Binding var currentUser: String
    
    @State private var playerTurn: Bool = true
    @State private var showHandStatus: Bool = false
    
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
                
                
                // Dealer's cards and outcome display
                LazyVGrid(columns: Array(repeating: GridItem(.fixed(135), spacing: -90), count: cardVM.dealerHand.count)) {
                    ForEach(cardVM.dealerHand) { card in
                        CardView(card: card, hand: .dealer)
                    }
                }
                
                Spacer()
                
                // Player's cards and outcome display
                LazyVGrid(columns: Array(repeating: GridItem(.fixed(135), spacing: -90), count: cardVM.playerHand.count)) {
                    ForEach(cardVM.playerHand) { card in
                        CardView(card: card, hand: .player)
                    }
                }
                
                // The player's stats
                GameStats(icon: "person.fill", money: 500, score: 21)
                
                HStack(spacing: 40.0) {
                    if playerTurn && cardVM.getPlayerTotal() < 21 && cardVM.playerHand.count < 5 {
                        Button {
                            withAnimation(.easeInOut(duration: 0.5)) {
                                cardVM.playerHit()
                            }
                        } label: {
                            Text("HIT")
                                .font(Font.custom("BeVietnamPro-Medium", size: 24))
                                .tracking(2.5)
                                .frame(width: 120, height: 24)
                                .modifier(TextModifier())
                        }
                        .buttonStyle(CustomButton())
                    }
                    
                    if playerTurn && cardVM.getPlayerTotal() >= 16 {
                        Button {
                            withAnimation(.spring()) {
                                playerTurn = false
                            }
                            
                            cardVM.dealerTurn()
                            
                            withAnimation(.spring()) {
                                showHandStatus = true
                            }
                            
                            print(cardVM.compareHands().rawValue)
                        } label: {
                            Text("STAY")
                                .font(Font.custom("BeVietnamPro-Medium", size: 24))
                                .tracking(2.5)
                                .frame(width: 120, height: 24)
                                .modifier(TextModifier())
                        }
                        .buttonStyle(CustomButton())
                        .scaleEffect(playerTurn ? 1.0 : 0.0)
                    }
                }
                .padding(.top, 5.0)
            }
            .padding(.horizontal, 10.0)
            
            VStack {
                Text(cardVM.displayDealerHandStatus())
                    .offset(y: -5)
                    .scaleEffect(showHandStatus ? 1.0 : 0.0)
                Text(cardVM.displayPlayerHandStatus())
                    .offset(y: 65)
                    .scaleEffect(showHandStatus ? 1.0 : 0.0)
            }
            .font(Font.custom("BeVietnamPro-Bold", size: 30))
            .modifier(TextModifier())
            
            if showRegister {     // Show registration modal when user wants to register a username
                RegistrationModal(userVM: userVM, dismiss: dismiss, showRegister: $showRegister, currentUser: $currentUser)
            }
        }
        .background(Background())
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(userVM: UserViewModel(), difficulty: .constant(Difficulty.easy), resume: .constant(true), currentUser: .constant("Duy"))
    }
}
