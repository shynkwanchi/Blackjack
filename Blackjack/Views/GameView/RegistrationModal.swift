/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 2
  Author: Nguyen Quang Duy
  ID: 3877991
  Created  date: 18/08/2023
  Last modified: 01/09/2023
  Acknowledgement: None
*/

import SwiftUI

struct RegistrationModal: View {
    var userVM: UserViewModel
    var cardVM: CardViewModel
    var dismiss: DismissAction
    @Binding var showRegister: Bool
    @State var usernameInput: String = ""
    @State var errorMesssage: String = ""
    @State var showErrorMessage: Bool = false
    
    var body: some View {
        ZStack {
            VStack(spacing: 10.0) {
                Text("Enter you username")
                    .font(Font.custom("BeVietnamPro-Medium", size: 24))
                    .multilineTextAlignment(.center)
                
                TextField("Username", text: $usernameInput)
                    .textFieldStyle(CustomTextField())
                
                Text(errorMesssage)
                    .font(Font.custom("BeVietnamPro-Bold", size: 15))
                    .foregroundColor(.red)
                    .multilineTextAlignment(.center)
                    .opacity(showErrorMessage ? 1 : 0)
                
                HStack(spacing: 40.0) {
                    Button {
                        dismiss()
                        playSoundEffect(sound: "cancel-button", type: "mp3")
                        playBackgroundMusic(sound: "menu-bgm", type: "mp3")
                    } label: {
                        Image(systemName: "arrowshape.backward.fill")
                            .iconModidifer()
                            .frame(width: 30)
                    }
                    .buttonStyle(CustomButton())
                    
                    Button {
                        withAnimation(.spring()) {
                            if usernameInput.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                                errorMesssage = "You can't leave this field empty!"
                                showErrorMessage = true
                            }
                            else if userVM.usernameExists(username: usernameInput.trimmingCharacters(in: .whitespacesAndNewlines)) {
                                errorMesssage = "Username already exists!"
                                showErrorMessage = true
                            }
                            else {
                                showErrorMessage = false
                                userVM.addUser(newUser: User(username: usernameInput.trimmingCharacters(in: .whitespacesAndNewlines), playerMoney: 1000, playerHighscore: 0, dealerMoney: 5000, dealerHighscore: 0, roundsPlayed: 1, roundsWon: 0, badge: .empty, joinDate: getDateAsString()))
                                showRegister = false
                            }
                            playSoundEffect(sound: "confirm-button", type: "mp3")
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

struct RegistrationModal_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
