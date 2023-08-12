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
    var body: some View {
        ZStack{
            Background()
            
            VStack{
                HStack {
                    Button {
                        
                    } label: {
                        Image(systemName: "house.fill")
                            .iconModidifer()
                            .frame(width: 30)
                    }
                    .buttonStyle(CustomButton())
                    Spacer()
                    
                    Text("ROUND 3")
                        .font(Font.custom("BricolageGrotesque-Bold", size: 30))
                        .tracking(2.5)
                        .shadow(radius: 1, x: 2.5, y: 2.5)
                        .foregroundColor(.accentColor)
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
                        Text("DRAW")
                            .modifier(ButtonTextModifier())
                    }
                    .buttonStyle(CustomButton())
                    
                    Button {
                        
                    } label: {
                        Text("CHECK")
                            .modifier(ButtonTextModifier())
                    }
                    .buttonStyle(CustomButton())
                }
                .padding(.top, 10.0)
            }
            .padding(.horizontal, 15.0)
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
