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
            .background(Color("item-background"))
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

// Customize the modal view
struct InnerModalModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.all, 15)
            .background(Color("inner-modal"))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .clipped()
            .shadow(radius: 1, x: 2.5, y: 2.5)
    }
}

struct OuterModalModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("outer-modal"))
    }
}

// Customize the user row based on their rank
struct UserRowModifier: ViewModifier {
    var rank: Int
    
    func body(content: Content) -> some View {
        switch rank {
        case 1:
            content.foregroundColor(Color("color-gold"))
        case 2:
            content.foregroundColor(Color("color-silver"))
        case 3:
            content.foregroundColor(Color("color-bronze"))
        default:
            content.foregroundColor(Color.accentColor)
        }
    }
}
