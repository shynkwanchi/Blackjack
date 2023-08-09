/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 2
  Author: Nguyen Quang Duy
  ID: 3877991
  Created  date: 09/08/2023
  Last modified: 09/08/2023
  Acknowledgement: None
*/

import SwiftUI

struct Header: View {
    var viewName: String
    
    var body: some View {
        VStack {
            Button {
                
            } label: {
                Image(systemName: "house.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
                
            }
            .buttonStyle(CustomButton())
            
            Text(viewName.uppercased())
                .font(Font.custom("BricolageGrotesque-Bold", size: 40))
                .tracking(2.5)
                .shadow(radius: 1, x: 2.5, y: 2.5)
                .foregroundColor(.accentColor)
        }
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header(viewName: "leaderboard")
    }
}
