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

struct RegistrationModal: View {
    @State var username: String = ""
    @State var errorMesssage: String = ""
    @State var showErrorMessage: Bool = false
    
    var body: some View {
        ZStack {
            VStack(spacing: 10.0) {
                Text("Enter you username")
                    .font(Font.custom("BeVietnamPro-Medium", size: 24))
                    .multilineTextAlignment(.center)
                
                TextField("Username", text: $username)
                    .textFieldStyle(CustomTextField())
                
                Text("You can't leave this field empty!")
                    .font(Font.custom("BeVietnamPro-Bold", size: 15))
                    .foregroundColor(.red)
                    .multilineTextAlignment(.center)
                    .opacity(showErrorMessage ? 1 : 0)
                
                HStack(spacing: 40.0) {
                    Button {
                        
                    } label: {
                        Image(systemName: "xmark")
                            .iconModidifer()
                            .frame(width: 30)
                    }
                    .buttonStyle(CustomButton())
                    
                    Button {
                        if (username.isEmpty) {
                            errorMesssage = "You can't leave this field empty!"
                            showErrorMessage = true
                        }
                        else {
                            showErrorMessage = false
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
        RegistrationModal()
    }
}
