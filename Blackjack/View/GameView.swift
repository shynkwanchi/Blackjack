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
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
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
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
                    }
                    .buttonStyle(CustomButton())
                }
                .padding(.bottom, 30.0)
                Spacer()
                
                HStack {
                    Button {
                        
                    } label: {
                        Text("DRAW")
                            .font(Font.custom("BricolageGrotesque-Light", size: 24))
                            .tracking(2.5)
                            .frame(width: 120, height: 30)
                            .shadow(radius: 1, x: 2.5, y: 2.5)
                            .foregroundColor(.accentColor)
                    }
                    .buttonStyle(CustomButton())
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Text("CHECK")
                            .font(Font.custom("BricolageGrotesque-Light", size: 24))
                            .tracking(2.5)
                            .frame(width: 120, height: 30)
                            .shadow(radius: 1, x: 2.5, y: 2.5)
                            .foregroundColor(.accentColor)
                    }
                    .buttonStyle(CustomButton())
                }
                .padding(.top, 30.0)
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
