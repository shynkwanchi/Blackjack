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
    @EnvironmentObject var userVM: UserViewModel
    
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
                        .background(Color("item-background"))
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .clipped()
                        .padding(.horizontal)
                    }
                }
                else {
                    VStack {
                        Spacer()
                        Text("The list of highscores will appear here.")
                            .font(Font.custom("BricolageGrotesque-Medium", size: 24))
                            .multilineTextAlignment(.center)
                            .padding()
                        Spacer()
                    }
                    .background(Color("item-background"))
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .clipped()
                }
            }
            .overlay {
                ZStack {
                    if userVM.showUser {
                        UserStats()
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct LeaderboardView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderBoardView()
            .environmentObject(UserViewModel())
    }
}
