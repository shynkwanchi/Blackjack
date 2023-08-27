/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 2
  Author: Nguyen Quang Duy
  ID: 3877991
  Created  date: 12/08/2023
  Last modified: To be updated
  Acknowledgement: YouTube, Sarunw
*/

import Foundation

let dummyUsers = [
    User(username: "Red", playerMoney: 0, playerHighscore: 1000, roundsPlayed: 12, roundsWon: 10, badge: .legend, joinDate: "20 Sep 2023"),
    User(username: "Chuck", playerMoney: 0, playerHighscore: 630, roundsPlayed: 12, roundsWon: 10, badge: .master, joinDate: "30 Jul 2023"),
    User(username: "Bomb", playerMoney: 0, playerHighscore: 99, roundsPlayed: 12, roundsWon: 10, badge: .empty, joinDate: "10 Dec 2023"),
    User(username: "Silver", playerMoney: 0, playerHighscore: 549, roundsPlayed: 12, roundsWon: 10, badge: .master, joinDate: "30 Jul 2023"),
    User(username: "Sonic", playerMoney: 0, playerHighscore: 918, roundsPlayed: 12, roundsWon: 8, badge: .master, joinDate: "23 Jun 2023"),
    User(username: "Tails", playerMoney: 0, playerHighscore: 824, roundsPlayed: 12, roundsWon: 8, badge: .master, joinDate: "21 Jun 2023"),
    User(username: "Knuckles", playerMoney: 0, playerHighscore: 84, roundsPlayed: 12, roundsWon: 8, badge: .empty, joinDate: "8 Apr 2023"),
    User(username: "Amy", playerMoney: 0, playerHighscore: 497, roundsPlayed: 12, roundsWon: 8, badge: .expert, joinDate: "8 Jun 2023"),
    User(username: "Mario", playerMoney: 0, playerHighscore: 728, roundsPlayed: 12, roundsWon: 9, badge: .master, joinDate: "11 Oct 2023"),
    User(username: "Luigi", playerMoney: 0, playerHighscore: 110, roundsPlayed: 12, roundsWon: 9, badge: .novice, joinDate: "11 Oct 2023"),
    User(username: "Toad", playerMoney: 0, playerHighscore: 324, roundsPlayed: 12, roundsWon: 9, badge: .expert, joinDate: "13 Sep 2023"),
    User(username: "Toadette", playerMoney: 0, playerHighscore: 273, roundsPlayed: 12, roundsWon: 9, badge: .expert, joinDate: "7 Nov 2023")
]

final class UserViewModel: ObservableObject {
    // List of users
    @Published var users: [User] = []
    
    // Display user in pop-up view
    @Published var showUser = false
    
    // Storing a selected user for viewing users' gaming history
    @Published var selectedUser: User!
    
    init() {
//        // Add users from dummy data
//        for user in dummyUsers {
//            users.append(user)
//        }
        loadUsers()
    }
    
    // Load user data from UserDefault
    func loadUsers() {
        if let savedUsers = UserDefaults.standard.object(forKey: "users") as? Data {
            self.users = try! PropertyListDecoder().decode([User].self, from: savedUsers)
        }
    }
    
    // Add a new user in UserDefault
    func addUser(newUser: User) {
        users.append(newUser)
        UserDefaults.standard.set(try? PropertyListEncoder().encode(users), forKey: "users")
    }
    
    // Get current user
    func getCurrentUser() -> User {
        if !users.isEmpty {
            let lastIndex = users.count - 1
            return users[lastIndex]
        }
        return User(username: "", playerMoney: 0, playerHighscore: -1, roundsPlayed: 0, roundsWon: -1, badge: .empty, joinDate: "")
    }
    
    // Update current user
    func updateCurrentUser(playerMoney: Int, playerHighScore: Int, dealerMoney: Int, dealerHighscore: Int, roundsPlayed: Int, roundsWon: Int, badge: Badge) {
        if !users.isEmpty {
            let lastIndex = users.count - 1
            users[lastIndex] = User(username: getCurrentUser().username, playerMoney: playerMoney, playerHighscore: playerHighScore, dealerMoney: dealerMoney, dealerHighscore: dealerHighscore, roundsPlayed: roundsPlayed, roundsWon: roundsWon, badge: badge, joinDate: getCurrentUser().joinDate)
            UserDefaults.standard.set(try? PropertyListEncoder().encode(users), forKey: "users")
        }
    }
    
    // Remove all users in UserDefault
    func deleteUsers() {
        users.removeAll()
        UserDefaults.standard.set(try? JSONEncoder().encode(users), forKey: "users")
    }
    
    // Sort users descending by their highscores
    func sortUsers() -> [User] {
        return users.sorted{ $0.playerHighscore > $1.playerHighscore }
    }
}
