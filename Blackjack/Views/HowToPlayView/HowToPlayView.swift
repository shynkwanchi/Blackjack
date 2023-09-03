/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 2
  Author: Nguyen Quang Duy
  ID: 3877991
  Created  date: 16/08/2023
  Last modified: 30/08/2023
  Acknowledgement: None
*/

import SwiftUI

struct HowToPlayView: View {
    var body: some View {
        VStack {
            Header(viewName: "Blackjack")
            
            ScrollView {
                VStack(spacing: 10.0) {
                    InformationSection(
                        title: "How to play",
                        textParagraphs: [
                            "Starting the game, you have $1000 and the dealer has $5000.",
                            "Starting each round, you and the dealer both have 2 cards. Tap on your cards to view them. If you have a Blackjack or a Double Ace, tap the STAY button immediately.",
                            "Otherwise, you can draw more cards by tapping the HIT button so that the total score of your cards is between 16 and 21 and you are allowed to draw at most 3 cards. If you don't want to do so, tap the STAY button.",
                            "Your cards and the dealer's cards will be shown and compared with each other to decide the winner of the round:\n+ If you win, you will gain money along with the total score of your cards in that round.\n+ If you lose, you will lose your money but your score still remains.\n+ If it is a tie, you won't lose any money as well as your score.",
                            "The game ends when you or the dealer run out of money."
                        ]
                    )
                    
                    InformationSection(
                        title: "Scoring",
                        textParagraphs: [
                            "The cards with different rank has different scores:\n+ Ranks 2-10 have the same score as its rank.\n+ Ranks J, Q, K have 10 points.\n+ Rank A has flexible score depending on the current total score of the cards, which can be 1, 10 or 11.",
                            "Based on the number of cards in a hand and their total scores, there are 5 hand status:\n+ Double Ace: two cards with rank A.\n+ Blackjack: two cards, one with rank A and one with 10 points (10, J, Q, K).\n+ Magic Five: five cards with total score at most 21.\n+ Normal: total score between 16 and 21.\n+ Bust: total score over 21."
                        ]
                    )
                    
                    InformationSection(
                        title: "Hand status comparison",
                        textParagraphs: [
                            "Bust < Normal < Magic Five < Blackjack < Double Ace.",
                            "If both you and the dealer have a Bust, it is considered a tie.",
                            "If both you and the dealer have a Normal or Magic Five:\n+ If your cards have a higher total score than the dealer, you win and vice versa.\n+ If your cards have the same total score as the dealer's, it is also considered a tie.",
                            "If both you and the dealer have a Blackjack or a Double Ace, you lose."
                        ]
                    )
                    
                    InformationSection(
                        title: "Difficulties",
                        textParagraphs: [
                            "There are 3 difficulties, each of which has different levels of rewards and penalties.",
                            "Easy:\nWin: gain $100.\nLose: lose $50.",
                            "Medium:\nWin: gain $150, double total score of your cards.\nLose: lose $150.",
                            "Hard:\nWin: gain $200, triple total score of your cards.\nLose: lose $400.",
                            "Meanwhile, regardless of difficulties, if the dealer wins, they will gain the same amount of money as yours. If they lose, they will lose the same money as they win."
                        ]
                    )

                    VStack(alignment: .leading,spacing: 10) {
                        Text("Achievements")
                            .font(Font.custom("BeVietnamPro-Medium", size: 20))
                        
                        Group {
                            Text("1. During the game, if you reach a certain score, you will achieve a badge.")
                                
                            Divider()
                                .background(Color.accentColor)
                            Text("2. Depending on your current highscore, you will achieve different badges.")
                            
                            HStack {
                                BadgeView(badge: .novice, size: 40)
                                Text("Novice badge - reach 100 points.")
                            }
                            
                            HStack {
                                BadgeView(badge: .expert, size: 40)
                                Text("Expert badge - reach 250 points.")
                            }
                            
                            HStack {
                                BadgeView(badge: .master, size: 40)
                                Text("Master badge - reach 500 points.")
                            }
                            
                            HStack {
                                BadgeView(badge: .legend, size: 40)
                                Text("Legend badge - reach 1000 points.")
                            }
                        }
                        .font(Font.custom("BeVietnamPro-Light", size: 15))
                    }
                    .modifier(SectionModifier())
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .clipped()
        }
        .background(Background())
    }
}

struct HowToPlayView_Previews: PreviewProvider {
    static var previews: some View {
        HowToPlayView()
    }
}
