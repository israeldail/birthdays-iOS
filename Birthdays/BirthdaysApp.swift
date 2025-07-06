//
//  BirthdaysApp.swift
//  Birthdays
//
//  Created by Israel Dail on 7/6/25.
//

import SwiftUI
import SwiftData

@main
struct BirthdaysApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Friend.self)
        }
    }
}
