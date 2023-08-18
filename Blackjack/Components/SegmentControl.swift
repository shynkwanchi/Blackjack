/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 2
  Author: Nguyen Quang Duy
  ID: 3877991
  Created  date: 15/08/2023
  Last modified: 18/08/2023
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
                } label: {
                    Text(option.description)
                        .modifier(TextModifier())
                        .font(self.option == option ? Font.custom("Poppins-Bold", size: 18) : Font.custom("Poppins-Medium", size: 15))
                        .frame(maxWidth: .infinity, maxHeight: 36)
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
