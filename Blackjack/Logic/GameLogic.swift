/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 2
  Author: Nguyen Quang Duy
  ID: 3877991
  Created  date: 23/08/2023
  Last modified: To be updated
  Acknowledgement: None
*/

import Foundation

func getDateAsString() -> String {
    // Create Date
    let date = Date()

    // Create Date Formatter
    let dateFormatter = DateFormatter()

    // Set Date Format
    dateFormatter.dateFormat = "dd MMM YYYY"

    // Convert Date to String
    return dateFormatter.string(from: date)
}

// Get the value of the card
func getCardValue(card: Card) -> Int {
    // The value of Ace is flexible, depending on the number of cards in player hand
    if card.rank != Rank.ace {
        // If the card is jack (J), queen (Q) or king (K), the value is 10
        if card.rank == Rank.jack || card.rank == Rank.queen || card.rank == Rank.king {
            return 10
        }
        if let cardValue = Int(card.rank.rawValue) {
             return cardValue
        }
    }
    // Return the temporary value of Ace
    return 0
}

// Get number of ace cards in player's hand
func getNumberOfAces(handOfCards: [Card]) -> Int {
    var numberOfAces: Int = 0
    for card in handOfCards {
        if card.rank == Rank.ace {
            numberOfAces += 1
        }
    }
    return numberOfAces
}

// Get number of cards with value 10 in player's hand - This fuction is used to check is player has a Blackjack
func getNumberOfCardsWithValueTen(handOfCards: [Card]) -> Int {
    var numberOfCardsWithValueTen: Int = 0
    for card in handOfCards {
        if getCardValue(card: card) == 10 {
            numberOfCardsWithValueTen += 1
        }
    }
    return numberOfCardsWithValueTen
}


// Get the RAW total value of the cards in player's hand - NOT including Ace cards
func getRawHandTotal(handOfCards: [Card]) -> Int {
    var rawTotal = 0
    for card in handOfCards {
        rawTotal += getCardValue(card: card)
    }
    return rawTotal
}

// Get the FLEXIBLE total value of the cards in player's hand - Including Ace cards
func getFlexibleHandTotal(handOfCards: [Card]) -> Int {
    // Initialize number of Ace cards and flexible total value
    let numberOfAces: Int = getNumberOfAces(handOfCards: handOfCards)
    var flexibleTotal: Int = getRawHandTotal(handOfCards: handOfCards)
    
    // Check if player's hand has two cards
    if (handOfCards.count == 2) {
        // If there are two Aces, the player gets a double Ace ==> total is automatically 21
        if numberOfAces == 2 {
            flexibleTotal += 21
        }
        // If there is one Ace, the Ace value will be 11 as the largest one
        else if numberOfAces == 1 {
            flexibleTotal += 11
        }
    }
    else {
        // If there is one Ace, the Ace value will varies depending on the RAW total value
        if numberOfAces == 1 {
            if flexibleTotal < 11 {
                flexibleTotal += 11
            }
            else if flexibleTotal == 11 {
                flexibleTotal += 10
            }
            else {
                flexibleTotal += 1
            }
        }
        // If there are two or more Aces, the Ace value will be 1 as the smallest value
        else if numberOfAces > 1 {
            flexibleTotal += numberOfAces
        }
    }
    
    return flexibleTotal
}

// Evaluate the player's hand of cards to return the hand status
func evaluateHand(handOfCards: [Card]) -> HandStatus {
    let numberOfAces: Int = getNumberOfAces(handOfCards: handOfCards)
    let numberOfCardsWithValueTen: Int = getNumberOfCardsWithValueTen(handOfCards: handOfCards)
    let handTotal: Int = getFlexibleHandTotal(handOfCards: handOfCards)
    
    // Check if player has 2 cards
    if handOfCards.count == 2 {
        if numberOfAces == 2 {
            return HandStatus.doubleAce
        }
        if numberOfAces == 1 && numberOfCardsWithValueTen == 1 {
            return HandStatus.blackjack
        }
        return HandStatus.normal
    }
    if handTotal <= 21 {
        if handOfCards.count == 5 {
            return HandStatus.magicFive
        }
        return HandStatus.normal
    }
    return HandStatus.bust
}

// Display status of the player's hand of cards
func displayHandStatus(handOfCards: [Card]) -> String {
    let handStatus: HandStatus = evaluateHand(handOfCards: handOfCards)
    let handTotal: Int = getFlexibleHandTotal(handOfCards: handOfCards)
    
    switch handStatus {
    case .bust:
        return "BUST"
    case .magicFive:
        return "MAGIC FIVE \(handTotal)"
    case .blackjack:
        return "BLACKJACK"
    case .doubleAce:
        return "DOUBLE ACE"
    default:
        return "\(handTotal) POINTS"
    }
}

// Check results
func checkResult(cardVM: CardViewModel, userVM: UserViewModel, difficulty: Difficulty, playerMoney: inout Int, playerHighscore: inout Int, newBadge: inout Badge, dealerMoney: inout Int, dealerHighscore: inout Int, currentRounds: inout Int, roundsWon: inout Int, bonusMoney: inout Int, lostMoney: inout Int, roundResultStatus: inout ResultStatus, gameResultStatus: inout ResultStatus, showRoundResult: inout Bool, showGameResult: inout Bool, showAchievement: inout Bool) {
    roundResultStatus = cardVM.compareHands()
    bonusMoney = 100
    var playerBonusScore = cardVM.getPlayerTotal()
    let dealerBonusScore = cardVM.getDealerTotal()
    
    // Depend of difficulties, the level of bonus and penalty will be different
    if difficulty == Difficulty.easy {
        lostMoney = (bonusMoney / 2)
    }
    else if difficulty == .medium {
        bonusMoney += 50
        lostMoney = bonusMoney
        playerBonusScore *= 2
    }
    else if difficulty == .hard {
        bonusMoney *= 2
        lostMoney = bonusMoney * 2
        playerBonusScore *= 3
    }
    
    // Check round result
    if roundResultStatus == .win {
        playerMoney += bonusMoney
        playerHighscore += playerBonusScore
        dealerMoney -= bonusMoney
        roundsWon += 1
    }
    else if roundResultStatus == .lose {
        playerMoney -= lostMoney
        dealerMoney += bonusMoney
        dealerHighscore += dealerBonusScore
    }
    
    // Check player highscore to get new badge
    if playerHighscore >= 1000 {
        newBadge = .legend
    }
    else if playerHighscore >= 500 {
        newBadge = .master
    }
    else if playerHighscore >= 250 {
        newBadge = .expert
    }
    else if playerHighscore >= 100 {
        newBadge = .novice
    }
    
    // Check if the user get a new badge
    if userVM.getCurrentUser().badge != newBadge {
        showAchievement = true
    }
    
    // Update current user
    userVM.updateCurrentUser(playerMoney: playerMoney, playerHighScore: playerHighscore, dealerMoney: dealerMoney, dealerHighscore: dealerHighscore,roundsPlayed: currentRounds, roundsWon: roundsWon, badge: newBadge)
    
    // Check current player an dealer money
    if (playerMoney <= 0) {
        playerMoney = 0
        gameResultStatus = .lose
        showGameResult = true
    }
    else if (dealerMoney <= 0) {
        dealerMoney = 0
        gameResultStatus = .win
        showGameResult = true
    }
    
    // If the game result is displayed, no need to displayed round result as well as proceed to the next round
    if !showGameResult {
        showRoundResult = true
        currentRounds += 1
    }
}
