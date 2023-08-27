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
//        Add users from dummy data
//        for user in dummyUsers {
//            users.append(user)
//        }
        loadUsers()
    }
    
    // Save user data from JSON file
    func saveUsers() {
        do {
            let fileURL = try FileManager.default.url(for: .desktopDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
                .appendingPathComponent("users.json")
            
            let encoder = JSONEncoder()
            try encoder.encode(users).write(to: fileURL)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    // Save user data from JSON file
    func loadUsers() {
        do {
            let fileURL = try FileManager.default.url(for: .desktopDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
                .appendingPathComponent("users.json")
            let data = try Data(contentsOf: fileURL)
            
            let decoder = JSONDecoder()
            users = try decoder.decode([User].self, from: data)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    // Add a new user
    func addUser(newUser: User) {
        users.append(newUser)
        saveUsers()
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
            saveUsers()
        }
    }
    
    // Remove all users in UserDefault
    func deleteUsers() {
        users.removeAll()
        saveUsers()
    }
    
    // Sort users descending by their highscores
    func sortUsers() -> [User] {
        return users.sorted{ $0.playerHighscore > $1.playerHighscore }
    }
}
