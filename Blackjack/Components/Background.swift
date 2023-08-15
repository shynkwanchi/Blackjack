/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 2
  Author: Nguyen Quang Duy
  ID: 3877991
  Created  date: 09/08/2023
  Last modified: 15/08/2023
  Acknowledgement: None
*/

import SwiftUI

struct Background: View {
    var body: some View {
        Image("background")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: UIScreen.main.bounds.size.width)
            .clipped()
            .ignoresSafeArea()
            .overlay(Color("background-overlay").ignoresSafeArea())
    }
}

struct Background_Previews: PreviewProvider {
    static var previews: some View {
        Background()
    }
}
