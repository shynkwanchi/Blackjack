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

struct Background: View {
    var body: some View {
        Image("background")
            .resizable()
            .ignoresSafeArea()
            .aspectRatio(contentMode: .fill)
            .frame(width: UIScreen.main.bounds.size.width)
            .overlay(Color("background-overlay"))
    }
}

struct Background_Previews: PreviewProvider {
    static var previews: some View {
        Background()
    }
}
