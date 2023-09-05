/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 2
  Author: Nguyen Quang Duy
  ID: 3877991
  Created  date: 09/08/2023
  Last modified: 05/09/2023
  Acknowledgement: None
*/

import SwiftUI

struct MenuView: View {
    @Environment(\.scenePhase) var scenePhase
    
    @EnvironmentObject var userVM: UserViewModel
    @StateObject private var cardVM: CardViewModel = CardViewModel()
    
    @AppStorage("resume") private var resume: Bool = false
    @AppStorage("appearance") private var appearance: Appearance = .light
    @AppStorage("difficulty") private var difficulty: Difficulty = .easy
    
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
                        NavigationButton(destinationView: GameView(userVM: userVM, cardVM: cardVM, difficulty: $difficulty, resume: $resume), icon: "play.fill", width: 240)
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
                    ResumeModal(userVM: userVM, cardVM: cardVM, resume: $resume, difficulty: $difficulty)
                }
            }
            .background(Background())
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .preferredColorScheme(appearance == .light ? .light : appearance == .dark ? .dark : nil)
        .onAppear(perform: {
            playBackgroundMusic(sound: "menu-bgm", type: "mp3")
        })
        .onChange(of: scenePhase) { newPhase in
            if newPhase == .active {
                playBackgroundMusic(sound: "menu-bgm", type: "mp3")
            }
            else if newPhase == .inactive || newPhase == .background {
                stopPlayingSounds()
            }
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
            .environmentObject(UserViewModel())
    }
}
