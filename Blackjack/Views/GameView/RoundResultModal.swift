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
    var roundResult: ResultStatus
    var money: Int
    
    var body: some View {
        ZStack {
            VStack {
                switch roundResult {
                case .win:
                    VStack {
                        Text("NICE PLAY!")
                            .font(Font.custom("Poppins-Medium", size: 40))
                        Text("You won $\(money).")
                            .font(Font.custom("Poppins-Light", size: 24))
                    }
                    .foregroundColor(Color.blue)
                case .lose:
                    VStack {
                        Text("TOO BAD!")
                            .font(Font.custom("Poppins-Medium", size: 40))
                        Text("You lost $\(money).")
                            .font(Font.custom("Poppins-Light", size: 24))
                    }
                    .foregroundColor(Color.red)
                case .tie:
                    VStack {
                        Text("TIE!")
                            .font(Font.custom("Poppins-Medium", size: 40))
                        Text("You didn't lose any money.")
                            .font(Font.custom("Poppins-Light", size: 24))
                    }
                }
                
                Button {

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
        RoundResultModal(roundResult: ResultStatus.win, money: 100)
    }
}
