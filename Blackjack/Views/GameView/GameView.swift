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
                    .font(Font.custom("BeVietnamPro-Bold", size: 30))
                    .tracking(2.5)
                    .modifier(TextModifier())
                Spacer()
                
                NavigationButton(destinationView: HowToPlayView(), icon: "questionmark", width: 30)
                    .buttonStyle(CustomButton())
            }
            .padding(.bottom, 5.0)
            GameStats(icon: "laptopcomputer", money: 250, score: 20)
            
            Spacer()
            
            GameStats(icon: "person.fill", money: 500, score: 21)
            HStack(spacing: 40.0) {
                Button {
                    
                } label: {
                    Text("HIT")
                        .font(Font.custom("BeVietnamPro-Medium", size: 24))
                        .tracking(2.5)
                        .frame(width: 120, height: 24)
                        .modifier(TextModifier())
                }
                .buttonStyle(CustomButton())
                
                Button {
                    
                } label: {
                    Text("STAY")
                        .font(Font.custom("BeVietnamPro-Medium", size: 24))
                        .tracking(2.5)
                        .frame(width: 120, height: 24)
                        .modifier(TextModifier())
                }
                .buttonStyle(CustomButton())
            }
            .padding(.top, 5.0)
        }
        .padding(.horizontal, 10.0)
        .background(Background())
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
