/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 2
  Author: Nguyen Quang Duy
  ID: 3877991
  Created  date: 11/08/2023
  Last modified: To be updated
  Acknowledgement: None
*/

import Foundation

struct Card: Identifiable {
    var id = UUID()
    var suit: Suit
    var rank: Rank
}
