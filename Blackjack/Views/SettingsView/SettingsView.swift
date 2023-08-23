/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 2
  Author: Nguyen Quang Duy
  ID: 3877991
  Created  date: 09/08/2023
  Last modified: To be updated
  Acknowledgement: None
*/

import SwiftUI

struct SettingsView: View {
    var userVM: UserViewModel
    
    @Binding var appearance: Appearance
    @State var isSoundOn: Bool = true
    @State var showReset: Bool = false
    @State private var showSuccess: Bool = false
    @Binding var difficulty: Difficulty
    
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
                            Text("Appearances")
                                .font(Font.custom("BeVietnamPro-Medium", size: 20))
                                .modifier(TextModifier())
                            SegmentControl(option: $appearance)
                        }
                        .padding(.vertical, 20)
                        
                        Divider()
                            .background(Color.accentColor)
                        
                        // Sound options
                        Toggle(isOn: $isSoundOn, label: {
                            Text("Sounds")
                                .font(Font.custom("BeVietnamPro-Medium", size: 20))
                                .modifier(TextModifier())
                        })
                        .toggleStyle(CustomToggle())
                        .padding(.vertical, 20)
                        
                        Divider()
                            .background(Color.accentColor)
                        
                        // Difficulty options
                        VStack(alignment: .leading) {
                            Text("Difficulties")
                                .font(Font.custom("BeVietnamPro-Medium", size: 20))
                                .modifier(TextModifier())
                            SegmentControl(option: $difficulty)
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
            
            if showReset {
                ResetModal(userVM: userVM, showReset: $showReset, showSuccess: $showSuccess)
            }
            
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
