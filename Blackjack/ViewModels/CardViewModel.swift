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

class CardViewModel {
    // A Deck of cards
    var cards: [CardModel] = []
    
    init() {
        for suit in Suit.allCases {
            for rank in Rank.allCases {
                cards.append(CardModel(suit: suit, rank: rank))
            }
        }
    }
    
    func shuffleDeck() {
        return cards.shuffle()
    }
}
