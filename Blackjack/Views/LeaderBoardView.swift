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
                    
                }
                Spacer()
            }
        }
    }
}

struct LeaderboardView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderBoardView()
    }
}
