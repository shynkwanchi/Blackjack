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
    var body: some View {
        ZStack {
            Background()
            
            VStack {
                Spacer()
                Logo()
                
                Spacer()
                VStack(alignment: .center) {
                    Button {
                        
                    } label: {
                        Image(systemName: "play.fill")
                            .iconModidifer()
                            .frame(width: 240)
                    }
                    .buttonStyle(CustomButton())
                    .padding(.vertical, 5)
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "trophy.fill")
                            .iconModidifer()
                            .frame(width: 240)
                    }
                    .buttonStyle(CustomButton())
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
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "gearshape.fill")
                                .iconModidifer()
                                .frame(width: 95)
                        }
                        .buttonStyle(CustomButton())
                        .padding(.all, 5)
                    }
                }
                
                Spacer()
            }
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}