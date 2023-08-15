/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 2
  Author: Nguyen Quang Duy
  ID: 3877991
  Created  date: 15/08/2023
  Last modified: To be updated
  Acknowledgement: None
*/

import SwiftUI

struct Badge: View {
    var badge: BadgeEnum
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
        Badge(badge: BadgeEnum.novice, size: 40)
    }
}
