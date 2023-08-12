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

struct LeaderBoardView: View {
    var body: some View {
        ZStack {
            Background()
            
            VStack {
                Header(viewName: "leader board")
                
                ScrollView {
                    VStack(spacing: 0) {
                        ForEach(0..<dummyUsers.count, id: \.self) { index in
                            if index != dummyUsers.count - 1 {
                                UserRow(user: dummyUsers[index], rank: index + 1)   // Add row divider between rows
                                Divider()
                                    .background(Color.accentColor)
                            }
                            else {
                                UserRow(user: dummyUsers[index], rank: index + 1)   // Except the last row
                            }
                        }
                    }
                }
                .background(Color("item-background"))
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .clipped()
                .padding(.horizontal)
            }
            .overlay {
//                UserStats(user: dummyUsers[0])
            }
        }
    }
}

struct LeaderboardView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderBoardView()
    }
}
