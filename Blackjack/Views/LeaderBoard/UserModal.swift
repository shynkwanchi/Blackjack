/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 2
  Author: Nguyen Quang Duy
  ID: 3877991
  Created  date: 11/08/2023
  Last modified: 20/08/2023
  Acknowledgement: YouTube
*/

import SwiftUI

struct UserModal: View {
    var userVM: UserViewModel
    
    init(userVM: UserViewModel) {
        self.userVM = userVM
    }
    
    var body: some View {
        // Check if the selected user is cleared...
        if (userVM.selectedUser != nil) {
            ZStack {
                VStack {
                    HStack {
                        Spacer()
                        Button {
                            userVM.showUser.toggle()
                            userVM.selectedUser = nil
                        } label: {
                            Image(systemName: "xmark")
                        }
                        .buttonStyle(ModalButton())
                    }
                    .padding(.bottom, 1.0)
                    
                    Text(userVM.selectedUser.username)
                        .font(Font.custom("BeVietnamPro-Medium", size: 24))
                        .padding(.bottom, 2.5)
                    
                    BadgeView(badge: userVM.selectedUser.badge, size: 125)
                    
                    HStack(alignment: .top) {
                        StatItem(name: "Joined", value: userVM.selectedUser.joinDate)
                            .frame(width: 125.0)
                        StatItem(name: "Highscore", value: String(userVM.selectedUser.highscore))
                            .frame(width: 125.0)
                    }
                    .padding(.top, 2.5)
                    .padding(.bottom, 0.5)
                    
                    HStack(alignment: .top) {
                        StatItem(name: "Rounds played", value: String(userVM.selectedUser.roundsPlayed))
                            .frame(width: 125.0)
                        StatItem(name: "Winning rate", value: "\(userVM.selectedUser.roundsWon * 100 / userVM.selectedUser.roundsPlayed)%")
                            .frame(width: 125.0)
                    }
                    .padding(.top, 0.5)
                    .padding(.bottom, 2.5)
                }
                .modifier(InnerModalModifier())
            }
            .modifier(OuterModalModifier())
        }
    }
}

struct UserModal_Previews: PreviewProvider {
    static var previews: some View {
        UserModal(userVM: UserViewModel())
    }
}
