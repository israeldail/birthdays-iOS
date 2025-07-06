//
//  ContentView.swift
//  Birthdays
//
//  Created by Israel Dail on 7/6/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    // friends will be stored here
    @Query(sort: \Friend.birthday) private var friends: [Friend]
    // connection between view and model container
    @Environment(\.modelContext) private var context
    
    @State private var newName = ""
    @State private var newDate = Date.now
    
    var body: some View {
        NavigationStack {
            List(friends) { friend in
                HStack {
                    if friend.isBirthdayToday {
                        Image(systemName: "birthday.cake")
                            .foregroundColor(.blue)
                    }
                    Text(friend.name)
                        .bold(friend.isBirthdayToday)
                    Spacer()
                    Text(friend.birthday, format: .dateTime.month(.wide).day().year())
                }
            }
            .navigationTitle("Birthdays")
            .safeAreaInset(edge: .bottom) {
                VStack(alignment: .center, spacing: 20) {
                   Text("New Birthday")
                        .font(.headline)
                    // date picker is configured to not select future dates
                    DatePicker(selection: $newDate, in: Date.distantPast...Date.now, displayedComponents: .date) {
                        TextField("Name", text: $newName)
                            .textFieldStyle(.roundedBorder)
                    }
                    Button("Save") {
                        let newFriend = Friend(name: newName, birthday: newDate)
                        // insert into swiftdata via context
                        context.insert(newFriend)
                        // reset name and date after input is saved
                        newName = ""
                        newDate = Date.now
                    }
                    .bold()
                }
                .padding()
                .background(.bar)
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Friend.self, inMemory: true)
}
