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

struct SettingsView: View {
    var userVM: UserViewModel
    @Binding var appearance: Appearance
    @Binding var difficulty: Difficulty
    @State var showReset: Bool = false
    @State private var showSuccess: Bool = false
    
    
    init(userVM: UserViewModel, appearance: Binding<Appearance>, difficulty: Binding<Difficulty>) {
        self.userVM = userVM
        self._appearance = appearance
        self._difficulty = difficulty
    }
    
    var body: some View {
        ZStack {
            VStack {
                Header(viewName: "Settings")
                
                ScrollView {
                    VStack(spacing: 0) {
                        // Display options
                        VStack(alignment: .leading) {
                            Text("Appearance")
                                .font(Font.custom("BeVietnamPro-Medium", size: 20))
                                .modifier(TextModifier())
                            SegmentControl(option: $appearance)
                        }
                        .padding(.vertical, 20)
                        
                        Divider()
                            .background(Color.accentColor)
                        
                        // Difficulty options
                        VStack(alignment: .leading) {
                            Text("Difficulty")
                                .font(Font.custom("BeVietnamPro-Medium", size: 20))
                                .modifier(TextModifier())
                            SegmentControl(option: $difficulty)
                            
                            // Difficulty description
                            Group {
                                if difficulty == .easy {
                                    Text("Win: gain $100.\nLose: lose $50.")
                                }
                                else if difficulty == .medium {
                                    Text("Win: gain $150, double total score of your cards.\nLose: lose $150.")
                                }
                                else if difficulty == .hard {
                                    Text("Win: gain $200, triple total score of your cards.\nLose: lose $400.")
                                }
                            }
                            .font(Font.custom("BeVietnamPro-Light", size: 18))
                            .modifier(TextModifier())
                            .frame(maxWidth: .infinity)
                        }
                        .padding(.vertical, 20)
                        
                        Divider()
                            .background(Color.accentColor)
                        
                        // Reset leaderboard
                        HStack {
                            Text("Reset leaderboard")
                                .font(Font.custom("BeVietnamPro-Medium", size: 20))
                                .modifier(TextModifier())
                            Spacer()
                            
                            Button {
                                showReset = true
                                playSoundEffect(sound: "confirm-button", type: "mp3")
                            } label: {
                                Text("RESET")
                                    .font(Font.custom("BeVietnamPro-Medium", size: 18))
                                    .tracking(2.5)
                                    .frame(width: 90, height: 18)
                                    .modifier(TextModifier())
                            }
                            .buttonStyle(CustomButton())
                            .disabled(userVM.users.isEmpty ? true : false)
                        }
                        .padding(.vertical, 20)
                    }
                    .padding(.horizontal, 10)
                }
            }
            
            // Show the reset warning modal
            if showReset {
                ResetModal(userVM: userVM, showReset: $showReset, showSuccess: $showSuccess)
            }
            
            // If users confirm reset the leaderboard, the Success modal will appear in a short amount of time
            if showSuccess {
                SuccessModal()
                .onAppear{
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                        withAnimation(.easeInOut(duration: 0.25)) {
                            self.showSuccess.toggle()
                        }
                    })
                }
            }
        }
        .background(Background())
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(userVM: UserViewModel(), appearance: .constant(Appearance.light), difficulty: .constant(Difficulty.easy))
    }
}
