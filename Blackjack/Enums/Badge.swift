/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 2
  Author: Nguyen Quang Duy
  ID: 3877991
  Created  date: 15/08/2023
  Last modified: 15/08/2023
  Acknowledgement: None
*/

import Foundation

enum Badge: Int, Decodable, Encodable {
    case novice = 100
    case expert = 250
    case master = 500
    case legend = 1000
    case empty
}
