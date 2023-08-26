/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 2
  Author: Nguyen Quang Duy
  ID: 3877991
  Created  date: 15/08/2023
  Last modified: 20/08/2023
  Acknowledgement: None
*/

import SwiftUI

struct BadgeView: View {
    var badge: Badge
    var size: Double
    
    var body: some View {
        if (badge == .novice) {
            Image("Novice badge")
                .badgeModidifer(size: size)
        }
        else if (badge == .expert) {
            Image("Expert badge")
                .badgeModidifer(size: size)
        }
        else if (badge == .master) {
            Image("Master badge")
                .badgeModidifer(size: size)
        }
        else if (badge == .legend) {
            Image("Legend badge")
                .badgeModidifer(size: size)
        }
    }
}

struct Badge_Previews: PreviewProvider {
    static var previews: some View {
        BadgeView(badge: Badge.legend, size: 125)
    }
}
