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

enum Difficulty: String, CaseIterable, CustomStringConvertible, Identifiable {
    case easy = "Easy"
    case medium = "Medium"
    case hard = "Hard"
    
    // Identifiable
    var id: String {
        self.rawValue
    }
        
    // CustomStringConvertible
    var description: String {
        self.rawValue
    }
}
