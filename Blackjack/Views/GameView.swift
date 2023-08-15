/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 2
  Author: Nguyen Quang Duy
  ID: 3877991
  Created  date: 09/08/2023
  Last modified: To be updated
  Acknowledgement: None
*/

import SwiftUI

struct GameView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack{
            HStack {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "arrowshape.backward.fill")
                        .iconModidifer()
                        .frame(width: 30)
                }
                .buttonStyle(CustomButton())
                Spacer()
                
                Text("ROUND 3")
                    .font(Font.custom("BricolageGrotesque-Bold", size: 30))
                    .tracking(2.5)
                    .modifier(TextModifier())
                Spacer()
                
                Button {
                    
                } label: {
                    Image(systemName: "questionmark")
                        .iconModidifer()
                        .frame(width: 30)
                }
                .buttonStyle(CustomButton())
            }
            .padding(.bottom, 10.0)
            GameStats(icon: "laptopcomputer", money: 250, score: 20)
            
            Spacer()
            
            GameStats(icon: "person.fill", money: 500, score: 21)
            HStack(spacing: 40.0) {
                Button {
                    
                } label: {
                    Text("HIT")
                        .font(Font.custom("BricolageGrotesque-Medium", size: 24))
                        .tracking(2.5)
                        .frame(width: 120, height: 30)
                        .modifier(TextModifier())
                }
                .buttonStyle(CustomButton())
                
                Button {
                    
                } label: {
                    Text("STAY")
                        .font(Font.custom("BricolageGrotesque-Medium", size: 24))
                        .tracking(2.5)
                        .frame(width: 120, height: 30)
                        .modifier(TextModifier())
                }
                .buttonStyle(CustomButton())
            }
            .padding(.top, 10.0)
        }
        .background(Background())
        .padding(.horizontal, 15.0)
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
