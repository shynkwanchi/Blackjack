/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 2
  Author: Nguyen Quang Duy
  ID: 3877991
  Created  date: 26/08/2023
  Last modified: 26/08/2023
  Acknowledgement: None
*/

import Foundation

enum HandStatus: Int, Decodable, Encodable {
    case doubleAce = 4
    case blackjack = 3
    case magicFive = 2
    case normal = 1
    case bust = 0
}
