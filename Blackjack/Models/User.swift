/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 2
  Author: Nguyen Quang Duy
  ID: 3877991
  Created  date: 11/08/2023
  Last modified: 15/08/2023
  Acknowledgement: None
*/

import Foundation

// The model of user {
struct User: Identifiable, Codable {
    var id = UUID().uuidString
    var username: String
    var money, highscore, roundsPlayed, roundsWon: Int
    var badge: Badge
    var joinDate: String
}
