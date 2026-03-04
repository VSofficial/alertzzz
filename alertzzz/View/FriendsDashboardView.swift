//
//  FriendsDashboardView.swift
//  alertzzz
//
//  Created by Varun Sharma on 13/12/25.
//


import SwiftUI

struct FriendsDashboardView: View {

    @Environment(AppState.self) private var appState

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {

                Text("My Status")
                    .font(.title2.bold())

                Text(appState.currentSelf.status.rawValue)
                    .font(.headline)

                Text(appState.statusMessage)

                NavigationLink("Change Status") {
                    SetStatusView()
                }

                Divider()

                ForEach(appState.friends) { friend in
                    HStack {
                        Text(friend.name)
                        Spacer()
                        Text(friend.status.rawValue)
                    }
                }
            }
            .padding()
            .navigationTitle("Friends")
        }
    }
}

#Preview {
    FriendsDashboardView()
        .environment(AppState())
}
   

