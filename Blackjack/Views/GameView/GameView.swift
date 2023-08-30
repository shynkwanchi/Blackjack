/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 2
  Author: Nguyen Quang Duy
  ID: 3877991
  Created  date: 09/08/2023
  Last modified: 30/08/2023
  Acknowledgement: None
*/

import SwiftUI

struct GameView: View {
    @Environment(\.dismiss) var dismiss
    private var userVM: UserViewModel
    private var cardVM: CardViewModel
    
    // Properties for game
    @Binding var difficulty: Difficulty
    @Binding var resume: Bool
    @Binding var currentUser: String
    
    @State private var dealerMoney: Int = 5000
    @State private var dealerHighscore: Int = 0
    @State private var dealerStay: Bool = false
    
    @State private var playerMoney: Int = 1000
    @State private var playerHighscore: Int = 0
    @State private var newBadge: Badge = .empty
    @State private var playerStay: Bool = false
    
    @State private var showHandStatus: Bool = false
    @State private var currentRounds: Int = 1
    @State private var roundsWon: Int = 0
    @State private var bonusMoney: Int = 0
    @State private var lostMoney: Int = 0
    @State private var roundResultStatus: ResultStatus = .empty
    @State private var gameResultStatus: ResultStatus = .empty
    
    @State private var showRegister: Bool = false
    @State private var showRoundResult: Bool = false
    @State private var showGameResult: Bool = false
    @State private var showAchievement: Bool = false
    
    @State private var currentProgress: DispatchWorkItem = DispatchWorkItem {}
    private func progress() -> DispatchWorkItem {
        return DispatchWorkItem {
            checkResult(cardVM: cardVM, userVM: userVM, difficulty: difficulty, playerMoney: &playerMoney, playerHighscore: &playerHighscore, newBadge: &newBadge, dealerMoney: &dealerMoney, dealerHighscore: &dealerHighscore, currentRounds: &currentRounds, roundsWon: &roundsWon, bonusMoney: &bonusMoney, lostMoney: &lostMoney, roundResultStatus: &roundResultStatus, gameResultStatus: &gameResultStatus, showRoundResult: &showRoundResult, showGameResult: &showGameResult, showAchievement: &showAchievement)
        }
    }
    
    init(userVM: UserViewModel, cardVM: CardViewModel, difficulty: Binding<Difficulty>, resume: Binding<Bool>, currentUser: Binding<String>) {
        self.userVM = userVM
        self.cardVM = cardVM
        self._difficulty = difficulty
        self._resume = resume
        self._currentUser = currentUser
        
        if self.resume {
            _showRegister = State(initialValue: false)
        }
        else {
            _showRegister = State(initialValue: true)
        }
        
        if !showRegister {
            _playerMoney = State(initialValue: userVM.getCurrentUser().playerMoney)
            _playerHighscore = State(initialValue: userVM.getCurrentUser().playerHighscore)
            _dealerMoney = State(initialValue: userVM.getCurrentUser().dealerMoney)
            _dealerHighscore = State(initialValue: userVM.getCurrentUser().dealerHighscore)
            _currentRounds = State(initialValue: userVM.getCurrentUser().roundsPlayed)
        }
        
        self.currentProgress = progress()
    }
 
    var body: some View {
        ZStack {
            VStack{
                // The header view
                HStack {
                    Button {
                        dismiss()
                        resume = true
                        playSoundEffect(sound: "cancel-button", type: "mp3")
                        playBackgroundMusic(sound: "menu-bgm", type: "mp3")
                    } label: {
                        Image(systemName: "arrowshape.backward.fill")
                            .iconModidifer()
                            .frame(width: 30)
                    }
                    .buttonStyle(CustomButton())
                    Spacer()
                    
                    Text("ROUND \(currentRounds)")
                        .font(Font.custom("BeVietnamPro-Bold", size: 30))
                        .tracking(2.5)
                        .modifier(TextModifier())
                    Spacer()
                    
                    NavigationButton(destinationView: HowToPlayView(), icon: "questionmark", width: 30)
                        .buttonStyle(CustomButton())
                }
                .padding(.bottom, 5.0)
                
                // The dealer's stats
                GameStats(icon: "laptopcomputer", money: dealerMoney, score: dealerHighscore)
                
                
                // Dealer's cards display
                LazyVGrid(columns: Array(repeating: GridItem(.fixed(135), spacing: -90), count: cardVM.dealerHand.count)) {
                    ForEach(cardVM.dealerHand) { card in
                        CardView(card: card, hand: .dealer, stayed: dealerStay)
                    }
                }
                
                Spacer()
                
                // Player's cards display
                LazyVGrid(columns: Array(repeating: GridItem(.fixed(135), spacing: -90), count: cardVM.playerHand.count)) {
                    ForEach(cardVM.playerHand) { card in
                        CardView(card: card, hand: .player, stayed: playerStay)
                    }
                }
                
                // The player's stats
                GameStats(icon: "person.fill", money: playerMoney, score: playerHighscore)
                
                HStack(spacing: 40.0) {
                    if !playerStay {
                        if cardVM.getPlayerTotal() < 21 && cardVM.playerHand.count < 5 {
                            Button {
                                withAnimation(.easeInOut(duration: 0.5)) {
                                    cardVM.playerHit()
                                    playSoundEffect(sound: "confirm-button", type: "mp3")
                                    playSecondSoundEffect(sound: "card-hit", type: "mp3")
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
                        
                        if cardVM.getPlayerTotal() >= 16 {
                            Button {
                                // If player tap this button, the action buttons (Hit and Stay) will dissappear
                                playerStay = true
                                cardVM.dealerTurn()
                                dealerStay = true
                                
                                withAnimation(.spring().delay(0.5)) {
                                    showHandStatus = true
                                }
                                
                                currentProgress = progress()
                                // Wait 3 seconds before the process of checking result begins
                                withAnimation(.spring()) {
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 3.0, execute: currentProgress)
                                }
                                
                                playSoundEffect(sound: "confirm-button", type: "mp3")
                            } label: {
                                Text("STAY")
                                    .font(Font.custom("BeVietnamPro-Medium", size: 24))
                                    .tracking(2.5)
                                    .frame(width: 120, height: 24)
                                    .modifier(TextModifier())
                            }
                            .buttonStyle(CustomButton())
                        }
                    }
                }
                .padding(.top, 5.0)
            }
            .padding(.horizontal, 10.0)
            
            // Display the status of player and dealer's hand of cards.
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
            
            // Show registration modal when user wants to register a username
            if showRegister {
                RegistrationModal(userVM: userVM, cardVM: cardVM, dismiss: dismiss, showRegister: $showRegister, currentUser: $currentUser)
            }
            
            // Display round result modal
            if showRoundResult {
                if roundResultStatus == .win {
                    RoundResultModal(showRoundResult: $showRoundResult, showHandStatus: $showHandStatus, playerStay: $playerStay, dealerStay: $dealerStay, cardVM: cardVM, roundResult: roundResultStatus, money: bonusMoney)
                }
                else if roundResultStatus == .lose {
                    RoundResultModal(showRoundResult: $showRoundResult, showHandStatus: $showHandStatus, playerStay: $playerStay, dealerStay: $dealerStay, cardVM: cardVM, roundResult: roundResultStatus, money: lostMoney)
                }
                else if roundResultStatus == .tie {
                    RoundResultModal(showRoundResult: $showRoundResult, showHandStatus: $showHandStatus, playerStay: $playerStay, dealerStay: $dealerStay, cardVM: cardVM, roundResult: roundResultStatus, money: 0)
                }
            }
            
            // Display game result modal
            if showGameResult {
                GameResultModal(resume: $resume, cardVM: cardVM, dismiss: dismiss, gameResult: gameResultStatus, currentUser: userVM.getCurrentUser())
            }
            
            // Display achievement modal
            if showAchievement {
                AchievementModal(showAchievement: $showAchievement, badge: newBadge)
            }
        }
        .background(Background())
        .onAppear(perform: {
            playBackgroundMusic(sound: "ingame-bgm", type: "mp3")
        })
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
