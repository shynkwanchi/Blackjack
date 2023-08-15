/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 2
  Author: Nguyen Quang Duy
  ID: 3877991
  Created  date: 12/08/2023
  Last modified: To be updated
  Acknowledgement: YouTube
*/

import Foundation

let dummyUsers = [
    User(username: "Red", money: 0, highscore: 1000, roundsPlayed: 12, roundsWon: 10, badge: .legend, joinDate: "20 Sep 2023"),
    User(username: "Chuck", money: 0, highscore: 630, roundsPlayed: 12, roundsWon: 10, badge: .master, joinDate: "30 Jul 2023"),
    User(username: "Bomb", money: 0, highscore: 99, roundsPlayed: 12, roundsWon: 10, badge: .empty, joinDate: "10 Dec 2023"),
    User(username: "Silver", money: 0, highscore: 549, roundsPlayed: 12, roundsWon: 10, badge: .master, joinDate: "30 Jul 2023"),
    User(username: "Sonic", money: 0, highscore: 918, roundsPlayed: 12, roundsWon: 8, badge: .master, joinDate: "23 Jun 2023"),
    User(username: "Tails", money: 0, highscore: 824, roundsPlayed: 12, roundsWon: 8, badge: .master, joinDate: "21 Jun 2023"),
    User(username: "Knuckles", money: 0, highscore: 84, roundsPlayed: 12, roundsWon: 8, badge: .empty, joinDate: "8 Apr 2023"),
    User(username: "Amy", money: 0, highscore: 497, roundsPlayed: 12, roundsWon: 8, badge: .expert, joinDate: "8 Jun 2023"),
    User(username: "Mario", money: 0, highscore: 728, roundsPlayed: 12, roundsWon: 9, badge: .master, joinDate: "11 Oct 2023"),
    User(username: "Luigi", money: 0, highscore: 110, roundsPlayed: 12, roundsWon: 9, badge: .novice, joinDate: "11 Oct 2023"),
    User(username: "Toad", money: 0, highscore: 324, roundsPlayed: 12, roundsWon: 9, badge: .expert, joinDate: "13 Sep 2023"),
    User(username: "Toadette", money: 0, highscore: 273, roundsPlayed: 12, roundsWon: 9, badge: .expert, joinDate: "7 Nov 2023")
]

final class UserViewModel: ObservableObject {
    // List of users
    @Published var users: [User] = []
    
    // Display user in pop-up view
    @Published var showUser = false
    
    // Storing a selected user for viewing users' gaming history
    @Published var selectedUser: User!
    
    init() {
        // Add users from dummy data
        for user in dummyUsers {
            users.append(user)
        }
    }
    
    // Sort users descending by their highscores
    func sortUsers() -> [User] {
        return users.sorted{ $0.highscore > $1.highscore }
    }
}
