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
    
    init(name: String, birthday: Date) {
        self.name = name
        self.birthday = birthday
    }
}
