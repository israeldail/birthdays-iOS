//
//  Friend.swift
//  Birthdays
//
//  Created by Israel Dail on 7/6/25.
//

import Foundation
import SwiftData

// friend data type
@Model
class Friend {
    var name: String
    var birthday: Date
    var notes: String
    
    init(name: String, birthday: Date, notes: String) {
        self.name = name
        self.birthday = birthday
        self.notes = notes
    }
    // computed variable to detect birthdays dynamically
    var isBirthdayToday: Bool {
        Calendar.current.isDateInToday(birthday)
    }
}
