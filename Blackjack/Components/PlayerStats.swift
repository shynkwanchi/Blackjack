/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 2
  Author: Nguyen Quang Duy
  ID: 3877991
  Created  date: 09/08/2023
  Last modified: To be added
  Acknowledgement: None
*/

import SwiftUI

struct PlayerStats: View {
    var icon: String
    var money, score: Int
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
                .padding(.all, 15)
                .foregroundColor(.accentColor)
                .background(Color(.black))
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .clipped()
        }
    }
}

struct PlayerStats_Previews: PreviewProvider {
    static var previews: some View {
        PlayerStats(icon: "laptopcomputer", money: 300, score: 21)
    }
}
