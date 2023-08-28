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

struct ModalButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
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
            .padding(.all, 20)
            .background(Color("inner-modal"))
            .cornerRadius(10)
            .frame(maxWidth: 325)
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
            .cornerRadius(10)
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
                .onTapGesture {
                    configuration.isOn.toggle()
                    playSound(sound: "blackjack-confirm-button", type: "mp3")
                }
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

// Customize the text field
struct CustomTextField: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .foregroundColor(.black)
            .font(Font.custom("BeVietnamPro-Light", size: 18))
            .multilineTextAlignment(.center)
            .padding(.all, 10)
            .background(Color("text-field"))
            .cornerRadius(10)
    }
}

// Customize the flip view
extension Image {
    func flipViewModidifer(degree: Double) -> some View {
        self
            .resizable()
            .scaledToFit()
            .rotation3DEffect(.degrees(degree), axis: (x: 0, y: 1, z: 0))
            .shadow(radius: 1, x: 2.5, y: 2.5)
    }
}
