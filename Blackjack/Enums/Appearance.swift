/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 2
  Author: Nguyen Quang Duy
  ID: 3877991
  Created  date: 16/08/2023
  Last modified: To be updated
  Acknowledgement: None
*/

import Foundation

enum Appearance: String, CaseIterable, CustomStringConvertible, Identifiable {
    case light = "Light"
    case dark = "Dark"
    case auto = "Auto"
    
    // Identifiable
    var id: String {
        self.rawValue
    }
        
    // CustomStringConvertible
    var description: String {
        self.rawValue
    }
}
