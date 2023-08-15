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

import Foundation

enum Difficulty: String, Decodable, Encodable {
    case easy = "Easy"
    case medium = "Medium"
    case hard = "Hard"
    case empty
}

