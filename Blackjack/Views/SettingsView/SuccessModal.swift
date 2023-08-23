/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 2
  Author: Nguyen Quang Duy
  ID: 3877991
  Created  date: 23/08/2023
  Last modified: 23/08/2023
  Acknowledgement: None
*/

import SwiftUI

struct SuccessModal: View {
    var body: some View {
        VStack {
            Image(systemName: "checkmark")
                .iconModidifer()
                .frame(width: 50, height: 50)
            Text("Successfully Reset")
                .font(Font.custom("BeVietnamPro-Medium", size: 20))
                .modifier(TextModifier())
        }
        .padding(.all, 10)
        .background(Color("button").opacity(0.75))
        .cornerRadius(10)
    }
}

struct SuccessModal_Previews: PreviewProvider {
    static var previews: some View {
        SuccessModal()
    }
}
