/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 2
  Author: Nguyen Quang Duy
  ID: 3877991
  Created  date: 15/08/2023
  Last modified: 20/08/2023
  Acknowledgement: YouTube, Stack Overflow
*/

import SwiftUI

struct SegmentControl<T: CaseIterable & Identifiable & Hashable & CustomStringConvertible>: View {
    @Binding var option: T
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach (Array(T.allCases)) { option in
                Button {
                    withAnimation(Animation.spring()) {
                        self.option = option
                    }
                    playSound(sound: "blackjack-confirm-button", type: "mp3")
                } label: {
                    Text(option.description)
                        .modifier(TextModifier())
                        .font(self.option == option ? Font.custom("BeVietnamPro-Bold", size: 18) : Font.custom("BeVietnamPro-Medium", size: 15))
                        .frame(maxWidth: .infinity)
                        .frame(height: 36)
                        .background(
                            ZStack {
                                if self.option == option {
                                    RoundedRectangle(cornerRadius: 18)
                                        .fill(Color("button"))
                                }
                            }
                        )
                }
            }
        }
        .padding(.all, 4)
        .background(Color("item-background"))
        .cornerRadius(24)
        .shadow(radius: 1, x: 2.5, y: 2.5)
    }
}

struct SegmentControl_Previews: PreviewProvider {
    static var previews: some View {
        SegmentControl(option: .constant(Difficulty.easy))
    }
}
