/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 2
  Author: Nguyen Quang Duy
  ID: 3877991
  Created  date: 20/08/2023
  Last modified: To be updated
  Acknowledgement: None
*/

import SwiftUI

struct ContinueModal: View {
    var body: some View {
        ZStack {
            VStack (spacing: 10.0) {
                HStack {
                    Spacer()
                    Button {
                        
                    } label: {
                        Image(systemName: "xmark")
                    }
                    .buttonStyle(ModalButton())
                }
                .padding(.bottom, 1.0)
                
                Text("Continue as Toad?")
                    .font(Font.custom("BeVietnamPro-Medium", size: 24))
                    .multilineTextAlignment(.center)
                
                Text("Do you want to continue your current progress or start a new game?")
                    .font(Font.custom("BeVietnamPro-Light", size: 15))
                    .multilineTextAlignment(.center)
                
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.all, 10.0)
                    .frame(width: 150)
                
                HStack() {
                    Button {
                        
                    } label: {
                        Text("NEW GAME")
                            .font(Font.custom("BeVietnamPro-Medium", size: 18))
                            .frame(height: 18)
                            .modifier(TextModifier())
                    }
                    .buttonStyle(CustomButton())
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Text("CONTINUE")
                            .font(Font.custom("BeVietnamPro-Medium", size: 18))
                            .frame(height: 18)
                            .modifier(TextModifier())
                    }
                    .buttonStyle(CustomButton())
                }
            }
            .modifier(InnerModalModifier())
        }
        .modifier(OuterModalModifier())
    }
}

struct ContinueModal_Previews: PreviewProvider {
    static var previews: some View {
        ContinueModal()
    }
}
