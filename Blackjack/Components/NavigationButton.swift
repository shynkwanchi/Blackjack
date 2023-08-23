/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 2
  Author: Nguyen Quang Duy
  ID: 3877991
  Created  date: 13/08/2023
  Last modified: 23/08/2023
  Acknowledgement: Stack Overflow
*/

import SwiftUI

struct NavigationButton<Content: View>: View {
    private var destinationView: Content
    private var icon: String
    private var width: Double
    
    init(destinationView: Content, icon: String, width: Double) {
        self.destinationView = destinationView
        self.icon = icon
        self.width = width
    }
    
    var body: some View {
        NavigationLink(destination: destinationView.navigationBarBackButtonHidden(true)) {
            Image(systemName: icon)
                .iconModidifer()
                .frame(width: width)
        }
        .buttonStyle(CustomButton())
    }
}

struct NavigationButton_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NavigationButton(destinationView: LeaderBoardView(userVM: UserViewModel()), icon: "trophy.fill", width: 240)
        }
    }
}
