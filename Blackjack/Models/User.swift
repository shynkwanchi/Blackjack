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
    var playerMoney, playerHighscore, dealerMoney, dealerHighscore, roundsPlayed, roundsWon: Int
    var badge: Badge
    var joinDate: String
    
    // For actual data
    init(username: String, playerMoney: Int, playerHighscore: Int, dealerMoney: Int, dealerHighscore: Int, roundsPlayed: Int, roundsWon: Int, badge: Badge, joinDate: String) {
        self.username = username
        self.playerMoney = playerMoney
        self.playerHighscore = playerHighscore
        self.dealerMoney = dealerMoney
        self.dealerHighscore = dealerHighscore
        self.roundsPlayed = roundsPlayed
        self.roundsWon = roundsWon
        self.badge = badge
        self.joinDate = joinDate
    }
    
    // For dummy data
    init(username: String, playerMoney: Int, playerHighscore: Int, roundsPlayed: Int, roundsWon: Int, badge: Badge, joinDate: String) {
        self.username = username
        self.playerMoney = playerMoney
        self.playerHighscore = playerHighscore
        self.dealerMoney = 0
        self.dealerHighscore = -1
        self.roundsPlayed = roundsPlayed
        self.roundsWon = roundsWon
        self.badge = badge
        self.joinDate = joinDate
    }
}
