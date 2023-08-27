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
    @Binding var playerTurn: Bool
    @State var cardVM: CardViewModel
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
                    }
                    .foregroundColor(Color.blue)
                case .lose:
                    VStack {
                        Text("TOO BAD!")
                            .font(Font.custom("BeVietnamPro-Medium", size: 40))
                        Text("You lost $\(money).")
                            .font(Font.custom("BeVietnamPro-Light", size: 24))
                    }
                    .foregroundColor(Color.red)
                default:
                    VStack {
                        Text("TIE!")
                            .font(Font.custom("BeVietnamPro-Medium", size: 40))
                        Text("You didn't lose any money.")
                            .font(Font.custom("BeVietnamPro-Light", size: 24))
                    }
                }
                
                Button {
                    cardVM = CardViewModel()
                    playerTurn = true
                    showRoundResult = false
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
        RoundResultModal(showRoundResult: .constant(true), playerTurn: .constant(false), cardVM: CardViewModel(), roundResult: ResultStatus.win, money: 100)
    }
}
