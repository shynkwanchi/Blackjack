/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 2
  Author: Nguyen Quang Duy
  ID: 3877991
  Created  date: 18/08/2023
  Last modified: To be updated
  Acknowledgement: None
*/

import SwiftUI

struct ResetModal: View {
    var userVM: UserViewModel
    @Binding var showReset: Bool
    @Binding var showSucess: Bool
    
    init(userVM: UserViewModel, showReset: Binding<Bool>, showSuccess: Binding<Bool>) {
        self.userVM = userVM
        self._showReset = showReset
        self._showSucess = showSuccess
    }
    
    var body: some View {
        ZStack {
            VStack(spacing: 10.0) {
                Text("Are you sure?")
                    .font(Font.custom("BeVietnamPro-Medium", size: 24))
                    .multilineTextAlignment(.center)
                
                Text("Resetting leaderboard will delete all of the available users records and cannot be undone.")
                    .font(Font.custom("BeVietnamPro-Light", size: 15))
                    .multilineTextAlignment(.center)
                
                HStack(spacing: 40.0) {
                    Button {
                        showReset = false
                        playSound(sound: "blackjack-cancel-button", type: "mp3")
                        return
                    } label: {
                        Image(systemName: "xmark")
                            .iconModidifer()
                            .frame(width: 30)
                    }
                    .buttonStyle(CustomButton())
                    
                    Button {
                        userVM.deleteUsers()
                        showReset = false
                        playSound(sound: "blackjack-confirm-button", type: "mp3")
                        withAnimation(.spring().delay(0.25)) {
                            showSucess.toggle()
                        }
                    } label: {
                        Image(systemName: "checkmark")
                            .iconModidifer()
                            .frame(width: 30)
                    }
                    .buttonStyle(CustomButton())
                }
            }
            .modifier(InnerModalModifier())
        }
        .modifier(OuterModalModifier())
    }
}

struct ResetModal_Previews: PreviewProvider {
    static var previews: some View {
        ResetModal(userVM: UserViewModel(), showReset: .constant(true), showSuccess: .constant(false))
    }
}
