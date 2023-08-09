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

struct Logo: View {
    var body: some View {
        VStack {
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.bottom, 10.0)
                .frame(width: 200)
            Text("BLACKJACK")
                .font(Font.custom("BricolageGrotesque-Bold", size: 40))
                .tracking(5)
                .shadow(radius: 1, x: 2.5, y: 2.5)
                .foregroundColor(.accentColor)
        }
    }
}

struct Logo_Previews: PreviewProvider {
    static var previews: some View {
        Logo()
    }
}
