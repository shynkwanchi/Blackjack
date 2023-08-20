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

struct Card: View {
    @State private var animating = false
    @State private var isCardFlipped = false
    @State private var rotation: Double = 0
    
    var cardName: String
    
    var body: some View {
        ZStack {
            if isCardFlipped {
                Image("card-back")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 125.0)
                    .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
            }
            else {
                Image(cardName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 125.0)
            }
        }
        .rotation3DEffect(.degrees(rotation), axis: (x: 0, y: 1, z: 0))
        .onTapGesture {
            withAnimation(Animation.linear(duration: 0.3)) {
                self.animating.toggle()
            }
        }
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { _ in
                if self.animating {
                    withAnimation(Animation.linear(duration: 0.01)) {
                        self.rotation += 3
                    }
                    if self.rotation == 90 || self.rotation == 270 {
                        self.isCardFlipped.toggle()
                    } else if self.rotation == 360 || self.rotation == 180 {
                        self.animating = false
                    }
                    
                    if self.rotation == 360 {
                        self.rotation = 0
                    }
                }
            }
        }
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        Card(cardName: "Spade A")
    }
}
