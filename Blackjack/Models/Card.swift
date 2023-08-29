/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 2
  Author: Nguyen Quang Duy
  ID: 3877991
  Created  date: 11/08/2023
  Last modified: 28/08/2023
  Acknowledgement: None
*/

import Foundation

struct Card: Identifiable {
    var id = UUID()
    var suit: Suit
    var rank: Rank
    var image: String
    
    init(id: UUID = UUID(), suit: Suit, rank: Rank) {
        self.id = id
        self.suit = suit
        self.rank = rank
        self.image = "\(self.suit.rawValue) \(self.rank.rawValue)"
    }
}
