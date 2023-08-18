/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 2
  Author: Nguyen Quang Duy
  ID: 3877991
  Created  date: 11/08/2023
  Last modified: 18/08/2023
  Acknowledgement: None
*/

import SwiftUI

struct UserRow: View {
    @EnvironmentObject var userVM: UserViewModel
    var user: User
    var rank: Int
    
    var body: some View {
        // List item of user and their highscore and achievement
        HStack {
            Text(String(rank))
                .font(Font.custom("Poppins-Medium", size: 30))
                .frame(width: 70.0)
                .padding(.horizontal, 5)
            
            VStack(alignment: .leading) {
                Text(user.username)
                    .font(Font.custom("Poppins-Medium", size: 20))
                    .lineLimit(1)
                Text(String(user.highscore))
                    .font(Font.custom("Poppins-Light", size: 18))
            }
            
            Spacer()
            
            Badge(badge: user.badge, size: 50)
            
            Button {
                userVM.selectedUser = user
                userVM.showUser.toggle()
            } label: {
                Image(systemName: "info.circle")
                    .frame(width: 24, height: 24)
            }
            .buttonStyle(ShowMoreButton())
        }
        .frame(height: 80.0)
        .shadow(radius: 1, x: 2.5, y: 2.5)
        .modifier(UserRowModifier(rank: rank))
    }
}

struct UserRow_Previews: PreviewProvider {
    static var previews: some View {
        UserRow(user: dummyUsers[0], rank: 1)
    }
}
