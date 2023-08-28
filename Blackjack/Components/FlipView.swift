/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 2
  Author: Nguyen Quang Duy
  ID: 3877991
  Created  date: 28/08/2023
  Last modified: 28/08/2023
  Acknowledgement: None
*/

import SwiftUI

struct FlipView: View {
    var frontView, backView: String
    @Binding var frontDegree: Double
    @Binding var backDegree: Double
    
    var body: some View {
        ZStack {
            Image(frontView)
                .flipViewModidifer(degree: frontDegree)
            Image(backView)
                .flipViewModidifer(degree: backDegree)
        }
    }
}

struct FlipView_Previews: PreviewProvider {
    static var previews: some View {
        FlipView(frontView: Card(suit: .spade, rank: .ace).image, backView: "card-back", frontDegree: .constant(0.0), backDegree: .constant(-90.0))
    }
}
