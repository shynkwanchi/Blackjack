/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 2
  Author: Nguyen Quang Duy
  ID: 3877991
  Created  date: 11/08/2023
  Last modified: To be added
  Acknowledgement: Hacking with Swift, Stack Overflow
*/

import SwiftUI

// Customize the style of the button
struct CustomButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.all, 15.0)
            .background(Color("button"))
            .foregroundColor(.accentColor)
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 1.25 : 1)
            .animation(.easeOut(duration: 0.25), value: configuration.isPressed)
            .shadow(radius: 1, x: 2.5, y: 2.5)
    }
}

// Customize the text inside the button
struct ButtonTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font.custom("BricolageGrotesque-Light", size: 24))
            .tracking(2.5)
            .frame(width: 120, height: 30)
            .shadow(radius: 1, x: 2.5, y: 2.5)
            .foregroundColor(.accentColor)
    }
}

// Customize the style of player's game stats
struct GameStatsModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.all, 10)
            .foregroundColor(.accentColor)
            .background(Color("player-stats"))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .clipped()
            .shadow(radius: 1, x: 2.5, y: 2.5)
    }
}

// Customize the style of icons
extension Image {
    func iconModidifer() -> some View {
        self
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(height: 30)
            .shadow(radius: 1, x: 2.5, y: 2.5)
    }
}

// Customize the pop-up view
struct BlurView : UIViewRepresentable {
    func makeUIView(context: Context) -> some UIVisualEffectView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .systemUltraThinMaterial))
        
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}
