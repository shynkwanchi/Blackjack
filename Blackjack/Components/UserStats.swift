//
//  UserStats.swift
//  Blackjack
//
//  Created by Duy Nguyen Quang on 11/08/2023.
//

import SwiftUI

struct UserStats: View {
    @Binding var showUserStats : Bool
    
    var body: some View {
        // Pop-up box of user's gaming history
        ZStack {
            VStack {
                Text("Username")
                    .font(Font.custom("BricolageGrotesque-Medium", size: 24))
                
                HStack(alignment: .top) {
                    VStack {
                        Text("Joined")
                            .font(Font.custom("BricolageGrotesque-Light", size: 15))
                            .multilineTextAlignment(.center)
                        Text("10 Aug 2023")
                            .font(Font.custom("BricolageGrotesque-Medium", size: 30))
                            .multilineTextAlignment(.center)
                    }
                    .frame(width: 125.0)
                    VStack {
                        Text("High score")
                            .font(Font.custom("BricolageGrotesque-Light", size: 15))
                        Text("128")
                            .font(Font.custom("BricolageGrotesque-Medium", size: 30))
                    }
                    .frame(width: 125.0)
                }
                .padding(.top, 1)
                .padding(.bottom, 0.5)
                
                HStack(alignment: .top) {
                    VStack {
                        Text("Rounds played")
                            .font(Font.custom("BricolageGrotesque-Light", size: 15))
                            .multilineTextAlignment(.center)
                        Text("32")
                            .font(Font.custom("BricolageGrotesque-Medium", size: 30))
                            .multilineTextAlignment(.center)
                    }
                    .frame(width: 125.0)
                    VStack {
                        Text("Winning rate")
                            .font(Font.custom("BricolageGrotesque-Light", size: 15))
                            .multilineTextAlignment(.center)
                        Text("64%")
                            .font(Font.custom("BricolageGrotesque-Medium", size: 30))
                            .multilineTextAlignment(.center)
                    }
                    .frame(width: 125.0)
                }
                .padding(.top, 0.5)
                .padding(.bottom, 1)
                
                Button {
                    showUserStats.toggle()
                } label: {
                    Image(systemName: "xmark")
                        .iconModidifer()
                        .frame(width: 30)
                }
                .buttonStyle(CustomButton())
            }
            .padding(.all, 15)
            .background(Color.accentColor)
            .cornerRadius(15)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.opacity(0.25))
    }
}

struct UserStats_Previews: PreviewProvider {
    static var previews: some View {
        UserStats(showUserStats: .constant(true))
    }
}
