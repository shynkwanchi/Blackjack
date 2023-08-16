/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 2
  Author: Nguyen Quang Duy
  ID: 3877991
  Created  date: 16/08/2023
  Last modified: 16/08/2023
  Acknowledgement: None
*/

import SwiftUI

struct InformationSection: View {
    var title: String
    var textParagraphs: [String]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10.0) {
            Text(title)
                .font(Font.custom("BricolageGrotesque-Medium", size: 24))
            
            ForEach(0..<textParagraphs.count, id: \.self) { index in
                if index != textParagraphs.count - 1 {
                    Text("\(index + 1). \(textParagraphs[index])")
                        .font(Font.custom("BricolageGrotesque-Light", size: 18))
                    
                    // Add divider between paragraphs
                    Divider()
                        .background(Color.accentColor)
                }
                else {
                    // Except the last paragraph
                    Text("\(index + 1). \(textParagraphs[index])")
                        .font(Font.custom("BricolageGrotesque-Light", size: 18))
                }
            }
        }
        .padding(.all, 10.0)
        .frame(width: UIScreen.main.bounds.width - 20)
        .modifier(TextModifier())
        .modifier(ListModifier())
    }
}

struct InformationSection_Previews: PreviewProvider {
    static var previews: some View {
        InformationSection(
            title: "Smash Gang",
            textParagraphs: [
                "Red, Chuck, Bomb, Silver",
                "Sonic the Hedgehog, Miles 'Tails' Prower, Knuckles the Echidna, Amy Rose",
                "Mario, Luigi, Toad, Toadette"
            ]
        )
    }
}
