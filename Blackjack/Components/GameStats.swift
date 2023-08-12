/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 2
  Author: Nguyen Quang Duy
  ID: 3877991
  Created  date: 09/08/2023
  Last modified: 11/08/2023
  Acknowledgement: None
*/

import SwiftUI

struct GameStats: View {
    var icon: String
    var money, score: Int
    
    var body: some View {
        HStack {
            // Player type: player or AI
            Image(systemName: icon)
                .iconModidifer()
                .frame(width: 30)
                .modifier(GameStatsModifier())
            
            // Money stat
            HStack {
                Image(systemName: "dollarsign")
                    .iconModidifer()
                    .frame(width: 30)
                Spacer()
                Text(String(money))
                    .font(Font.custom("BricolageGrotesque-light", size: 25))
            }
            .frame(width: 120)
            .modifier(GameStatsModifier())
            
            // Score stat
            HStack {
                Image(systemName: "trophy.fill")
                    .iconModidifer()
                    .frame(width: 30)
                Spacer()
                Text(String(score))
                    .font(Font.custom("BricolageGrotesque-light", size: 25))
            }
            .frame(width: 120)
            .modifier(GameStatsModifier())
        }
    }
}

struct GameStats_Previews: PreviewProvider {
    static var previews: some View {
        GameStats(icon: "laptopcomputer", money: 300, score: 21)
    }
}
