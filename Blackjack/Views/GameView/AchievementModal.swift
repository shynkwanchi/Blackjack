/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 2
  Author: Nguyen Quang Duy
  ID: 3877991
  Created  date: 20/08/2023
  Last modified: 30/08/2023
  Acknowledgement: None
*/

import SwiftUI

struct AchievementModal: View {
    @Binding var showAchievement: Bool
    var badge: Badge
    
    var body: some View {
        ZStack {
            VStack(spacing: 10.0) {
                if (badge == .novice) {
                    Text("NOVICE BADGE")
                        .font(Font.custom("BeVietnamPro-Medium", size: 30))
                        .multilineTextAlignment(.center)
                }
                else if (badge == .expert) {
                    Text("EXPERT BADGE")
                        .font(Font.custom("BeVietnamPro-Medium", size: 30))
                        .multilineTextAlignment(.center)
                }
                else if (badge == .master) {
                    Text("MASTER BADGE")
                        .font(Font.custom("BeVietnamPro-Medium", size: 30))
                        .multilineTextAlignment(.center)
                }
                else if (badge == .legend) {
                    Text("LEGEND BADGE")
                        .font(Font.custom("BeVietnamPro-Medium", size: 30))
                        .multilineTextAlignment(.center)
                }
                
                BadgeView(badge: badge, size: 125)
                
                Text("You have reached \n\(badge.rawValue) points")
                    .font(Font.custom("BeVietnamPro-Light", size: 18))
                    .multilineTextAlignment(.center)
                
                Button {
                    showAchievement = false
                    playSoundEffect(sound: "confirm-button", type: "mp3")
                } label: {
                    Image(systemName: "checkmark")
                        .iconModidifer()
                        .frame(width: 30)
                }
                .buttonStyle(CustomButton())
            }
            .modifier(InnerModalModifier())
        }
        .modifier(OuterModalModifier())
    }
}

struct MilestoneModal_Previews: PreviewProvider {
    static var previews: some View {
        AchievementModal(showAchievement: .constant(true), badge: .legend)
    }
}
