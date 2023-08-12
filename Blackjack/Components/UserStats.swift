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

struct UserStats: View {
    var user: User
    
    var body: some View {
        // Pop-up box of user's gaming history
        ZStack {
            VStack {
                Text(user.username)
                    .font(Font.custom("BricolageGrotesque-Medium", size: 24))
                
                HStack(alignment: .top) {
                    StatItem(name: "Joined", value: user.joinDate)
                        .frame(width: 125.0)
                    StatItem(name: "Highscore", value: String(user.highscore))
                        .frame(width: 125.0)
                }
                .padding(.top, 1)
                .padding(.bottom, 0.5)
                
                HStack(alignment: .top) {
                    StatItem(name: "Rounds played", value: String(user.roundsPlayed))
                        .frame(width: 125.0)
                    StatItem(name: "Winning rate", value: "\(user.roundsWon * 100 / user.roundsPlayed)%")
                        .frame(width: 125.0)
                }
                .padding(.top, 0.5)
                .padding(.bottom, 1)
                
                Button {
                    
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

struct UserStats_Previews: PreviewProvider {
    static var previews: some View {
        UserStats(user: dummyUsers[0])
    }
}
