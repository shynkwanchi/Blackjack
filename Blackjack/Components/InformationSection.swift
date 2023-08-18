/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 2
  Author: Nguyen Quang Duy
  ID: 3877991
  Created  date: 18/08/2023
  Last modified: 18/08/2023
  Acknowledgement: None
*/

import SwiftUI

struct InformationSection: View {
    var title: String
    var textParagraphs: [String]
    
    var body: some View {
        VStack(alignment: .leading,spacing: 10) {
            Text(title)
                .font(Font.custom("Poppins-Medium", size: 20))
            
            ForEach(0..<textParagraphs.count, id: \.self) { index in
                if index != textParagraphs.count - 1 {
                    Text("\(index + 1). \(textParagraphs[index])")         // Add row divider between paragraph
                        .font(Font.custom("Poppins-Light", size: 15))
                    Divider()
                        .background(Color.accentColor)
                }
                else {
                    Text("\(index + 1). \(textParagraphs[index])")         // Except the last paragraph
                        .font(Font.custom("Poppins-Light", size: 15))
                }
            }
        }
        .modifier(SectionModifier())
    }
}

struct InformationSection_Previews: PreviewProvider {
    static var previews: some View {
        InformationSection(
            title: "Smash Gang",
            textParagraphs: [
                "Red, Chuck, Bomb, Silver",
                "Sonic, Tails, Knuckcles, Amy",
                "Mario, Luigi, Toad, Toadette"
            ]
        )
    }
}
