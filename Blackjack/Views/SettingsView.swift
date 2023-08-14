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

struct SettingsView: View {
    @State private var isSoundOn = true
    
    var body: some View {
        ZStack {
            Background()
            
            VStack {
                Header(viewName: "settings")
                
                VStack(spacing: 0) {
                    // Display options
                    VStack(alignment: .leading) {
                        Text("Appearances")
                            .font(Font.custom("BricolageGrotesque-Medium", size: 20))
                            .modifier(TextModifier())
                        
                    }
                    .padding(.vertical, 20)
                    
                    Divider()
                        .background(Color.accentColor)
                    
                    // Sound options
                    Toggle(isOn: $isSoundOn, label: {
                        Text("Sounds")
                            .font(Font.custom("BricolageGrotesque-Medium", size: 20))
                            .modifier(TextModifier())
                    })
                    .toggleStyle(CustomToggle())
                    .padding(.vertical, 20)
                    
                    Divider()
                        .background(Color.accentColor)
                    
                    // Difficulty options
                    VStack(alignment: .leading) {
                        Text("Difficulties")
                            .font(Font.custom("BricolageGrotesque-Medium", size: 20))
                            .modifier(TextModifier())
                        
                    }
                    .padding(.vertical, 20)
                    
                    Divider()
                        .background(Color.accentColor)
                    
                    // Reset leaderboard
                    HStack {
                        Text("Reset leaderboard")
                            .font(Font.custom("BricolageGrotesque-Medium", size: 20))
                            .modifier(TextModifier())
                        Spacer()
                        
                        Button {
                            
                        } label: {
                            Text("RESET")
                                .font(Font.custom("BricolageGrotesque-Medium", size: 18))
                                .tracking(2.5)
                                .frame(width: 90, height: 24)
                                .modifier(TextModifier())
                        }
                        .buttonStyle(CustomButton())
                    }
                    .padding(.vertical, 20)
                }
                .padding(.horizontal, 20)
                
                Spacer()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
