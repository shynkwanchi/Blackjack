/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 2
  Author: Nguyen Quang Duy
  ID: 3877991
  Created  date: 09/08/2023
  Last modified: 30/08/2023
  Acknowledgement: None
*/

import SwiftUI

struct ContentView: View {
    @StateObject var userVM = UserViewModel()
    var body: some View {
        MenuView()
            .environmentObject(userVM)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
