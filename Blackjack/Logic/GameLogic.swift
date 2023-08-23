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

var cardDeck: [CardModel] = CardViewModel().cards.shuffled()

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

func dealCards() {
    
}
