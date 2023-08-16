/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 2
  Author: Nguyen Quang Duy
  ID: 3877991
  Created  date: 16/08/2023
  Last modified: To be updated
  Acknowledgement: None
*/

import SwiftUI

struct HowToPlayView: View {
    var body: some View {
        VStack {
            Header(viewName: "How To Play")
            
            ScrollView {
                VStack(spacing: 10.0) {
                    InformationSection(
                        title: "Smash Gang",
                        textParagraphs: [
                            "Red, Chuck, Bomb, Silver",
                            "Sonic, Tails, Knuckles, Amy",
                            "Mario, Luigi, Toad, Toadette"
                        ]
                    )
                    
                    InformationSection(
                        title: "Kamen Rider Gang",
                        textParagraphs: [
                            "Ace Ukiyo, Keiwa Sakurai, Neon Kurama, Michinaga Azuma",
                            "Sougo Tokiwa, Geiz Miyokoin, Woz, Tsukuyomi Alpina",
                        ]
                    )
                }
            }
        }
        .background(Background())
    }
}

struct HowToPlayView_Previews: PreviewProvider {
    static var previews: some View {
        HowToPlayView()
    }
}
