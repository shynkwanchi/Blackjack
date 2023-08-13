/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 2
  Author: Nguyen Quang Duy
  ID: 3877991
  Created  date: 09/08/2023
  Last modified: To be updated
  Acknowledgement: None
*/

import SwiftUI

struct MenuView: View {
    @EnvironmentObject var userVM: UserViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                Background()
                
                VStack {
                    Spacer()
                    Logo()
                    
                    Spacer()
                    VStack(alignment: .center) {
                        NavigationButton(destinationView: GameView(), icon: "play.fill", width: 240)                    .padding(.vertical, 5)
                        
                        NavigationButton(destinationView: LeaderBoardView(), icon: "trophy.fill", width: 240)
                            .padding(.vertical, 5)
                        
                        HStack {
                            Button {
                                
                            } label: {
                                Image(systemName: "questionmark")
                                    .iconModidifer()
                                    .frame(width: 95)
                            }
                            .buttonStyle(CustomButton())
                                .padding(.all, 5)
                            
                            NavigationButton(destinationView: SettingsView(), icon: "gearshape.fill", width: 95)
                                .padding(.all, 5)
                        }
                    }
                    
                    Spacer()
                }
            }
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
            .environmentObject(UserViewModel())
    }
}
