/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 2
  Author: Nguyen Quang Duy
  ID: 3877991
  Created  date: 09/08/2023
  Last modified: 20/08/2023
  Acknowledgement: None
*/

import SwiftUI

// This struct is used for leaderboard and settings view
struct Header: View {
    @Environment(\.dismiss) var dismiss
    var viewName: String
    
    var body: some View {
        VStack {
            Button {
                dismiss()
            } label: {
                Image(systemName: "arrowshape.backward.fill")
                    .iconModidifer()
                    .frame(width: 30)
            }
            .buttonStyle(CustomButton())
            
            Text(viewName.uppercased())
                .font(Font.custom("BeVietnamPro-Bold", size: 40))
                .tracking(2.5)
                .padding(.vertical, 5)
                .modifier(TextModifier())
        }
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header(viewName: "Leaderboard")
    }
}
