/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 2
  Author: Nguyen Quang Duy
  ID: 3877991
  Created  date: 11/08/2023
  Last modified: To be added
  Acknowledgement: YouTube
*/

import SwiftUI

// Pop-up box of user's gaming history
struct UserStats: View {
    @EnvironmentObject var userVM: UserViewModel
    
    var body: some View {
        // Check if the selected user is cleared...
        if (userVM.selectedUser != nil) {
            ZStack {
                VStack {
                    Text(userVM.selectedUser.username)
                        .font(Font.custom("BricolageGrotesque-Medium", size: 24))
                    
                    HStack(alignment: .top) {
                        StatItem(name: "Joined", value: userVM.selectedUser.joinDate)
                            .frame(width: 125.0)
                        StatItem(name: "Highscore", value: String(userVM.selectedUser.highscore))
                            .frame(width: 125.0)
                    }
                    .padding(.top, 1)
                    .padding(.bottom, 0.5)
                    
                    HStack(alignment: .top) {
                        StatItem(name: "Rounds played", value: String(userVM.selectedUser.roundsPlayed))
                            .frame(width: 125.0)
                        StatItem(name: "Winning rate", value: "\(userVM.selectedUser.roundsWon * 100 / userVM.selectedUser.roundsPlayed)%")
                            .frame(width: 125.0)
                    }
                    .padding(.top, 0.5)
                    .padding(.bottom, 1)
                    
                    Button {
                        userVM.showUser.toggle()
                        userVM.selectedUser = nil
                    } label: {
                        Image(systemName: "xmark")
                            .iconModidifer()
                            .frame(width: 30)
                    }
                    .buttonStyle(CustomButton())
                }
                .modifier(InnerModalModifier())
            }
            .modifier(OuterModalModifier())
        }
    }
}

struct UserStats_Previews: PreviewProvider {
    static var previews: some View {
        UserStats()
            .environmentObject(UserViewModel())
    }
}
