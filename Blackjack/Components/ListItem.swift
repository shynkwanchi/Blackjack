/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 2
  Author: Nguyen Quang Duy
  ID: 3877991
  Created  date: 11/08/2023
  Last modified: To be updated
  Acknowledgement: None
*/

import SwiftUI

struct ListItem: View {
    @State private var showUserStats : Bool = false
    
    var body: some View {
        ZStack {
            // List item of user and their highscore and achievement
            HStack {
                Text("1")
                    .font(Font.custom("BricolageGrotesque-Medium", size: 30))
                    .frame(width: 80.0)
                
                VStack(alignment: .leading) {
                    Text("Red J. Bird")
                        .font(Font.custom("BricolageGrotesque-Medium", size: 20))
                    Text("1000")
                        .font(Font.custom("BricolageGrotesque-Light", size: 18))
                }
                
                Spacer()
                
                Button {
                    showUserStats.toggle()
                } label: {
                    Image(systemName: "info.circle")
                        .frame(width: 24, height: 24)
                        .padding(.all, 5)
                }
            }
            .frame(height: 80.0)
            
            // Show the user stats if the button at the end of the list item is clicked
            if showUserStats {
                UserStats(showUserStats: $showUserStats)
            }
        }
    }
}

struct ListItem_Previews: PreviewProvider {
    static var previews: some View {
        ListItem()
    }
}
