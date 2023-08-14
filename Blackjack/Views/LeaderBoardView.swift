/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 2
  Author: Nguyen Quang Duy
  ID: 3877991
  Created  date: 09/08/2023
  Last modified: To be updated
  Acknowledgement: None
*/

import SwiftUI

struct LeaderBoardView: View {
    var userVM: UserViewModel
    var sortedUsers: [User] = []
    
    init(userVM: UserViewModel) {
        self.userVM = userVM
        sortedUsers = userVM.sortUsers()
    }
    
    var body: some View {
        ZStack {
            Background()
            
            VStack {
                Header(viewName: "leader board")
                
                // Check if the user data is empty
                if (!sortedUsers.isEmpty) {
                    ScrollView {
                        VStack(spacing: 0) {
                            ForEach(0..<sortedUsers.count, id: \.self) { index in
                                if index != sortedUsers.count - 1 {
                                    UserRow(user: sortedUsers[index], rank: index + 1)   // Add row divider between rows
                                    Divider()
                                        .background(Color.accentColor)
                                }
                                else {
                                    UserRow(user: sortedUsers[index], rank: index + 1)   // Except the last row
                                }
                            }
                        }
                    }
                    .modifier(ListModifier())
                }
                else {
                    VStack(alignment: .center) {
                        Spacer()
                        Text("The list of highscores will appear here.")
                            .font(Font.custom("BricolageGrotesque-Medium", size: 24))
                            .shadow(radius: 1, x: 2.5, y: 2.5)
                            .foregroundColor(.accentColor)
                            .multilineTextAlignment(.center)
                        Spacer()
                    }
                    .padding(.top, 10)
                    .frame(width: UIScreen.main.bounds.width - 20)
                    .modifier(ListModifier())
                }
                
            }
            .padding(.horizontal, 10)
            .overlay {
                ZStack {
                    if userVM.showUser {
                        UserStats(userVM: userVM)
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct LeaderboardView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderBoardView(userVM: UserViewModel())
    }
}
