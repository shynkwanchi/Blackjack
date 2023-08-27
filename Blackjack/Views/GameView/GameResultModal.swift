/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 2
  Author: Nguyen Quang Duy
  ID: 3877991
  Created  date: 18/08/2023
  Last modified: To be updated
  Acknowledgement: None
*/

import SwiftUI

struct GameResultModal: View {
    @Binding var resume: Bool
    var dismiss: DismissAction
    var gameResult: ResultStatus
    var currentUser: User
    
    var body: some View {
        ZStack {
            VStack {
                if (gameResult == .win) {
                    VStack {
                        Text("YOU WON!")
                            .font(Font.custom("BeVietnamPro-Medium", size: 40))
                        Text("Congratulations!\nYou are a Blackjack Star.")
                            .font(Font.custom("BeVietnamPro-Light", size: 18))
                            .multilineTextAlignment(.center)
                    }
                    .foregroundColor(Color.blue)
                } else if (gameResult == .lose) {
                    VStack {
                        Text("GAME OVER!")
                            .font(Font.custom("BeVietnamPro-Medium", size: 40))
                        Text("Out of money!\nBetter luck next time.")
                            .font(Font.custom("BeVietnamPro-Light", size: 18))
                            .multilineTextAlignment(.center)
                    }
                    .foregroundColor(Color.red)
                }
                
                VStack(spacing: 0.0) {
                    Text(currentUser.username)
                        .font(Font.custom("BeVietnamPro-Medium", size: 24))
                    
                    BadgeView(badge: currentUser.badge, size: 125)
                        .padding(.vertical)
                    
                    StatItem(name: "NEW HIGHSCORE!", value: String(1021))
                }
                .padding(/*@START_MENU_TOKEN@*/.vertical, 5.0/*@END_MENU_TOKEN@*/)
                
                // Exit button
                Button {
                    resume = false
                    dismiss()
                } label: {
                    Image(systemName: "arrowshape.backward.fill")
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

struct GameResultModal_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
