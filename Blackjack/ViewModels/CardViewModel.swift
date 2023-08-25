/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 2
  Author: Nguyen Quang Duy
  ID: 3877991
  Created  date: 21/08/2023
  Last modified: To be updated
  Acknowledgement: YouTube
*/

import Foundation

class CardViewModel: ObservableObject {
    // A Deck of cards
    var deckOfCards: [Card] = []
    
    // Cards in player and dealer's hand
    @Published var playerHand: [Card] = []
    @Published var dealerHand: [Card] = []
    
    init() {
        for suit in Suit.allCases {
            for rank in Rank.allCases {
                deckOfCards.append(Card(suit: suit, rank: rank))
            }
        }
        dealCards()
    }
    
    func dealCards() {
        deckOfCards.shuffle()
        for _ in 1...2 {
            playerHand.append(deckOfCards.removeLast())
            dealerHand.append(deckOfCards.removeLast())
        }
    }
    
    func playerHit() {
        playerHand.append(deckOfCards.removeLast())
    }
}
