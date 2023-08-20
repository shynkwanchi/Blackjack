/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 2
  Author: Nguyen Quang Duy
  ID: 3877991
  Created  date: 12/08/2023
  Last modified: 20/08/2023
  Acknowledgement: None
*/

import SwiftUI

struct StatItem: View {
    var name, value: String
    
    var body: some View {
        VStack {
            Text(name)
                .font(Font.custom("BeVietnamPro-Light", size: 15))
                .multilineTextAlignment(.center)
                .foregroundColor(.gray)
            Text(value)
                .font(Font.custom("BeVietnamPro-Medium", size: 30))
                .multilineTextAlignment(.center)
        }
    }
}

struct StatItem_Previews: PreviewProvider {
    static var previews: some View {
        StatItem(name: "Joined", value: "10 Aug 2023")
    }
}
