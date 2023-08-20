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
                VStack {
                    Image("logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(.bottom, 10.0)
                        .frame(width: 200)
                    Text("BLACKJACK")
                        .font(Font.custom("BeVietnamPro-Bold", size: 40))
                        .tracking(5)
                        .shadow(radius: 1, x: 2.5, y: 2.5)
                        .foregroundColor(.accentColor)
                }
                
                Spacer()
                VStack(alignment: .center) {
                    NavigationButton(destinationView: GameView(), icon: "play.fill", width: 240)
                        .padding(.vertical, 5)
                    
                    NavigationButton(destinationView: LeaderBoardView(userVM: userVM), icon: "trophy.fill", width: 240)
                        .padding(.vertical, 5)
                    
                    HStack {
                        NavigationButton(destinationView: HowToPlayView(), icon: "questionmark", width: 95)
                            .padding(.all, 5)
                        
                        NavigationButton(destinationView: SettingsView(appearance: $appearance, isSoundOn: true, difficulty: $difficulty), icon: "gearshape.fill", width: 95)
                            .padding(.all, 5)
                    }
                }
                
                Spacer()
            }
            .background(Background())
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .frame(maxWidth: .infinity)
        .preferredColorScheme(appearance == .light ? .light : appearance == .dark ? .dark : nil)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
            .environmentObject(UserViewModel())
    }
}
