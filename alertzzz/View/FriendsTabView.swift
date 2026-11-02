//
//  FriendsTabView.swift
//  alertzzz
//
//  Created by Varun Sharma on 13/12/25.
//

import SwiftUI


struct FriendsTabView: View {

    @State private var vm = FriendsViewModel()

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {

                SearchBar(text: $vm.searchText)
                FilterChips(selected: $vm.selectedFilter)
                
                
                VStack(spacing: 20) {
                    ForEach(vm.groupedFriends.keys.sorted(), id: \.self) { key in
                        VStack(alignment: .leading, spacing: 8) {
                            Text(key)
                                .font(.caption)
                                .foregroundStyle(.secondary)

                            ForEach(vm.groupedFriends[key]!) { friend in
                                FriendRow(friend: friend)
                            }
                        }
                    }
                }
            }
            .padding()
        }
        .navigationTitle("Friends")
        .navigationBarTitleDisplayMode(.inline)
        .preferredColorScheme(.dark)
    }
}

#Preview {
    NavigationStack {
        FriendsTabView()
    }
}
