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

struct RoundResultModal: View {
    @Binding var showRoundResult: Bool
    @Binding var showHandStatus: Bool
    @Binding var playerStay: Bool
    @Binding var dealerStay: Bool
    var cardVM: CardViewModel
    var roundResult: ResultStatus
    var money: Int
    
    var body: some View {
        ZStack {
            VStack {
                switch roundResult {
                case .win:
                    VStack {
                        Text("NICE PLAY!")
                            .font(Font.custom("BeVietnamPro-Medium", size: 40))
                        Text("You won $\(money).")
                            .font(Font.custom("BeVietnamPro-Light", size: 24))
                            .multilineTextAlignment(.center)
                    }
                    .foregroundColor(Color.blue)
                case .lose:
                    VStack {
                        Text("TOO BAD!")
                            .font(Font.custom("BeVietnamPro-Medium", size: 40))
                        Text("You lost $\(money).")
                            .font(Font.custom("BeVietnamPro-Light", size: 24))
                            .multilineTextAlignment(.center)
                    }
                    .foregroundColor(Color.red)
                default:
                    VStack {
                        Text("TIE!")
                            .font(Font.custom("BeVietnamPro-Medium", size: 40))
                        Text("You didn't lose any money.")
                            .font(Font.custom("BeVietnamPro-Light", size: 24))
                            .multilineTextAlignment(.center)
                    }
                }
                
                Button {
                    withAnimation(.spring()) {
                        cardVM.dealCards()
                        // Reset to initial state
                        playerStay = false
                        dealerStay = false
                        showHandStatus = false
                        showRoundResult = false
                    }
                } label: {
                    Image(systemName: "forward.fill")
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

struct RoundResultModal_Previews: PreviewProvider {
    static var previews: some View {
        RoundResultModal(showRoundResult: .constant(true), showHandStatus: .constant(true), playerStay: .constant(true), dealerStay: .constant(true),cardVM: CardViewModel(), roundResult: ResultStatus.win, money: 100)
    }
}
