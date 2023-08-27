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
   
    @AppStorage("currentUser") private var currentUser: String = ""     // This attribute is used to get the current user by username
    @AppStorage("resume") private var resume: Bool = false
    @AppStorage("appearance") private var appearance: Appearance = .light
    @AppStorage("difficulty") private var difficulty: Difficulty = .easy
    @AppStorage("currentDealerMoney") private var currentDealerMoney: Int = 5000
    @AppStorage("currentDealerHighscore") private var currentDealerHighscore: Int = 0
    
    init() {
        print(currentUser)
        print(resume)
    }
    
    var body: some View {
        NavigationView {
            ZStack {
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
                        NavigationButton(destinationView: GameView(userVM: userVM, difficulty: $difficulty, resume: $resume, currentUser: $currentUser), icon: "play.fill", width: 240)
                            .padding(.vertical, 5)
                        
                        NavigationButton(destinationView: LeaderBoardView(userVM: userVM), icon: "trophy.fill", width: 240)
                            .padding(.vertical, 5)
                        
                        HStack {
                            NavigationButton(destinationView: HowToPlayView(), icon: "questionmark", width: 95)
                                .padding(.all, 5)
                            
                            NavigationButton(destinationView: SettingsView(userVM: userVM, appearance: $appearance, difficulty: $difficulty), icon: "gearshape.fill", width: 95)
                                .padding(.all, 5)
                        }
                    }
                    
                    Spacer()
                }
                
                if (resume) {
                    ResumeModal(userVM: userVM, difficulty: $difficulty, resume: $resume, currentUser: $currentUser)
                }
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
