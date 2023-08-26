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
    // Function where dealer will decide if they want to draw more cards or stay
    func dealerTurn() {
        var currentDifference: Int = abs(21 - getDealerTotal())
        var tempHandOfCards: [Card] = dealerHand
        var tempDifference: Int = 0, tempTotal: Int = 0
        
        // Dealer can draw up to 3 cards
        for _ in 1...3 {
            // Check if dealer has a blackjack or double ace
            if currentDifference == 0 {
                return
            }
            
            if getDealerTotal() < 16 {
                dealerHand.append(deckOfCards.removeLast())
            }
            else {
                if let newCard = deckOfCards.last {
                    tempHandOfCards.append(newCard)
                }
                tempTotal = getFlexibleHandTotal(handOfCards: tempHandOfCards)
                tempDifference = abs(21 - tempTotal)
                if (currentDifference > tempDifference) {
                    currentDifference = tempDifference
                    dealerHand.append(deckOfCards.removeLast())
                }
                else {
                    break
                }
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
    
    // Compare the hands of player and dealer
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
