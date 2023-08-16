/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 2
  Author: Nguyen Quang Duy
  ID: 3877991
  Created  date: 09/08/2023
  Last modified: To be updated
  Acknowledgement: Stack Overflow
*/

import SwiftUI

struct MenuView: View {
    @EnvironmentObject var userVM: UserViewModel
    
    @AppStorage("appearance") private var appearance: Appearance = .light
    @AppStorage("difficulty") private var difficulty: Difficulty = .easy
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Logo()
                
                Spacer()
                VStack(alignment: .center) {
                    NavigationButton(destinationView: GameView(), icon: "play.fill", width: 240)
                        .padding(.vertical, 5)
                    
                    NavigationButton(destinationView: LeaderBoardView(userVM: userVM), icon: "trophy.fill", width: 240)
                        .padding(.vertical, 5)
                    
                    HStack {
                        NavigationButton(destinationView: HowToPlayView(), icon: "questionmark", width: 95)
                            .padding(.vertical, 5)
                        
                        NavigationButton(destinationView: SettingsView(appearance: $appearance, isSoundOn: true, difficulty: $difficulty), icon: "gearshape.fill", width: 95)
                            .padding(.all, 5)
                    }
                }
                
                Spacer()
            }
            .background(Background())
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .preferredColorScheme(appearance == .light ? .light : appearance == .dark ? .dark : nil)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
            .environmentObject(UserViewModel())
    }
}
