/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 2
  Author: Nguyen Quang Duy
  ID: 3877991
  Created  date: 15/08/2023
  Last modified: To be updated
  Acknowledgement: YouTube
*/

import SwiftUI

struct SegmentControl: View {
    @State var isSelected: Int
    
    // For sliding animations
    @Namespace var animation
    
    var body: some View {
        HStack(spacing: 0) {
            Button {
                withAnimation(.spring()) {
                    self.isSelected = 0
                }
            } label: {
                Text("Light")
                    .modifier(TextModifier())
                    .font(isSelected == 0 ? Font.custom("BricolageGrotesque-Bold", size: 18) : Font.custom("BricolageGrotesque-Medium", size: 18))
                    .frame(maxWidth: .infinity, maxHeight: 36)
                    .background(
                        ZStack {
                            if isSelected == 0 {
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color("button"))
                                    .matchedGeometryEffect(id: "TAB", in: animation)
                            }
                        }
                    )
            }
            .clipShape(Capsule())
            
            Button {
                withAnimation(.spring()) {
                    self.isSelected = 1
                }
            } label: {
                Text("Dark")
                    .modifier(TextModifier())
                    .font(isSelected == 1 ? Font.custom("BricolageGrotesque-Bold", size: 18) : Font.custom("BricolageGrotesque-Medium", size: 18))
                    .frame(maxWidth: .infinity, maxHeight: 36)
                    .background(
                        ZStack {
                            if isSelected == 1 {
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color("button"))
                                    .matchedGeometryEffect(id: "TAB", in: animation)
                            }
                        }
                    )
            }
            .clipShape(Capsule())
            
            Button {
                withAnimation(.spring()) {
                    self.isSelected = 2
                }
            } label: {
                Text("Auto")
                    .modifier(TextModifier())
                    .font(isSelected == 2 ? Font.custom("BricolageGrotesque-Bold", size: 18) : Font.custom("BricolageGrotesque-Medium", size: 18))
                    .frame(maxWidth: .infinity, maxHeight: 36)
                    .background(
                        ZStack {
                            if isSelected == 2 {
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color("button"))
                                    .matchedGeometryEffect(id: "TAB", in: animation)
                            }
                        }
                    )
            }
            .clipShape(Capsule())
        }
        .padding(.all, 4)
        .background(Color("item-background"))
        .cornerRadius(20)
        .shadow(radius: 1, x: 2.5, y: 2.5)
    }
}

struct SegmentControl_Previews: PreviewProvider {
    static var previews: some View {
        SegmentControl(isSelected: 0)
    }
}

