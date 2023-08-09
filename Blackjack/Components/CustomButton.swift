/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 2
  Author: Nguyen Quang Duy
  ID: 3877991
  Created  date: 09/08/2023
  Last modified: 09/08/2023
  Acknowledgement: None
*/

import SwiftUI

struct CustomButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.all, 15.0)
            .background(Color("button"))
            .foregroundColor(.accentColor)
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 1.35 : 1)
            .animation(.easeOut(duration: 0.25), value: configuration.isPressed)
            .shadow(radius: 1, x: 2.5, y: 2.5)
    }
}

struct ButtonStyles_Previews: PreviewProvider {
    static var previews: some View {
        Button {
            
        } label: {
            Image(systemName: "play.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 240, height: 30)
        }
        .buttonStyle(CustomButton())
    }
}
