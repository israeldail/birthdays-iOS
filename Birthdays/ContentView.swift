//
//  ContentView.swift
//  Birthdays
//
//  Created by Israel Dail on 7/6/25.
//

import SwiftUI

struct ContentView: View {
    // friends will be stored here
    @State private var friends: [Friend] = [
        Friend(name: "Israel Dail", birthday: .now),
        Friend(name: "Naraya Gonzalez", birthday: Date(timeIntervalSince1970: 0)),
    ]
    @State private var newName = ""
    @State private var newDate = Date.now
    
    var body: some View {
        NavigationStack {
            List(friends, id: \.name) { friend in
                HStack {
                    Text(friend.name)
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
                        friends.append(newFriend)
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
}
