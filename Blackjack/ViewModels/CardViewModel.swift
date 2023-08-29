/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 2
  Author: Nguyen Quang Duy
  ID: 3877991
  Created  date: 21/08/2023
  Last modified: 28/08/2023
  Acknowledgement: None
*/

import Foundation

class CardViewModel: ObservableObject {
    // A Deck of cards
    var deckOfCards: [Card] = []
    
    // Cards in player and dealer's hand
    @Published var playerHand: [Card] = []
    @Published var dealerHand: [Card] = []
    
    init() {
        dealCards()
    }
    
    func createCardDeck() {
        for suit in Suit.allCases {
            for rank in Rank.allCases {
                deckOfCards.append(Card(suit: suit, rank: rank))
            }
        }
        deckOfCards.shuffle()
    }
    
    func dealCards() {
        // Clear the current deck along with player and dealer's hands
        deckOfCards.removeAll()
        playerHand.removeAll()
        dealerHand.removeAll()
        
        // Create a new card deck
        createCardDeck()
        
        // Deal cards
        for _ in 1...2 {
            playerHand.append(deckOfCards.removeLast())
            dealerHand.append(deckOfCards.removeLast())
        }
    }
    
    // Player's operation
    func playerHit() {
        playerHand.append(deckOfCards.removeLast())
    }
    
    func getPlayerTotal() -> Int {
        return getFlexibleHandTotal(handOfCards: playerHand)
    }
    
    func evaluatePlayerHand() -> HandStatus {
        return evaluateHand(handOfCards: playerHand)
    }
    
    func displayPlayerHandStatus() -> String {
        return displayHandStatus(handOfCards: playerHand)
    }
    
    // Dealer's operation
    // Function where dealer will decide if they want to hit (draw more cards) or stay (stop drawing any cards)
    func dealerTurn() {
        var tempHandOfCards: [Card] = dealerHand
        var tempDifference: Int = 0, tempTotal: Int = 0
        
        // Dealer can draw up to 3 cards
        for _ in 1...3 {
            // Check if dealer's total is 21 or more
            if getDealerTotal() < 21 {
                // If the dealer's total is not at least 16, they have to hit
                if getDealerTotal() < 16 {
                    dealerHand.append(deckOfCards.removeLast())
                    tempHandOfCards = dealerHand
                }
                // Otherwise, the dealer can hit so that the total is as close to 21 as possible
                else {
                    if let newCard = deckOfCards.last {
                        tempHandOfCards.append(newCard)
                    }
                    tempTotal = getFlexibleHandTotal(handOfCards: tempHandOfCards)
                    tempDifference = 21 - tempTotal
                    if (abs(21 - getDealerTotal()) > abs(tempDifference)) {
                        dealerHand.append(deckOfCards.removeLast())
                    }
                    else {
                        return
                    }
                }
            }
            // If so, the dealer stays
            else {
                return
            }
        }
    }
    
    func getDealerTotal() -> Int {
        return getFlexibleHandTotal(handOfCards: dealerHand)
    }
    
    func evaluateDealerHand() -> HandStatus {
        return evaluateHand(handOfCards: dealerHand)
    }
    
    func displayDealerHandStatus() -> String {
        return displayHandStatus(handOfCards: dealerHand)
    }
    
    // Compare the hands of player and dealer to determine the winner of the round
    func compareHands() -> ResultStatus {
        let playerHandStatus: HandStatus = evaluatePlayerHand()
        let dealerHandStatus: HandStatus = evaluateDealerHand()
        let playerTotal: Int = getPlayerTotal()
        let dealerTotal: Int = getDealerTotal()
        
        if playerHandStatus.rawValue > dealerHandStatus.rawValue {
            return .win
        }
        if playerHandStatus.rawValue == dealerHandStatus.rawValue {
            if playerHandStatus == .normal || playerHandStatus == .magicFive {
                if playerTotal > dealerTotal {
                    return .win
                }
                if playerTotal == dealerTotal {
                    return .tie
                }
            }
            if playerHandStatus == .bust {
                return .tie
            }
        }
        return .lose
    }
}
