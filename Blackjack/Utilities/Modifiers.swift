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

struct ShowMoreButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.all, 10.0)
            .scaleEffect(configuration.isPressed ? 1.25 : 1)
            .animation(.easeOut(duration: 0.25), value: configuration.isPressed)
    }
}

// Customize the text inside the button
struct TextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(radius: 1, x: 2.5, y: 2.5)
            .foregroundColor(.accentColor)
    }
}

// Customize the style of icons
extension Image {
    func iconModidifer() -> some View {
        self
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(height: 30)
            .foregroundColor(.accentColor)
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

// Customize the style of player's game stats
struct GameStatsModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.all, 10)
            .background(Color("item-background"))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .clipped()
            .shadow(radius: 1, x: 2.5, y: 2.5)
    }
}

// Customize the list of highscores in leaderboard view
struct ListModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Color("item-background"))
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .clipped()
            .shadow(radius: 1, x: 2.5, y: 2.5)
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

// Customize the badge
extension Image {
    func badgeModidifer(size: Double) -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: size, height: size)
            .shadow(radius: 1, x: 2.5, y: 2.5)
    }
}

// Customize the toggle button
struct CustomToggle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
            Spacer()
            Rectangle()
                .foregroundColor(configuration.isOn ? Color("button") : Color("inactive-toggle"))
                .frame(width: 70, height: 40, alignment: .center)
                .animation(.easeInOut(duration: 0.25), value: configuration.isOn)
                .overlay(
                    Circle()
                        .foregroundColor(.white)
                        .padding(.all, 4)
                        .offset(x: configuration.isOn ? 15 : -15, y: 0)
                        .animation(.spring(), value: configuration.isOn)
                ).cornerRadius(20)
                .onTapGesture { configuration.isOn.toggle() }
        }
    }
}

// Customize the information section view
struct SectionModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.all, 10.0)
            .frame(width: UIScreen.main.bounds.width - 20)
            .modifier(TextModifier())
            .modifier(ListModifier())
    }
}
