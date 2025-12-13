//
//  FriendsDashboardView.swift
//  alertzzz
//
//  Created by Varun Sharma on 13/12/25.
//

import SwiftUI

struct FriendsDashboardView: View {

    @State private var vm = FriendsDashboardViewModel()
    @State private var selectedTab: Tab = .status

    enum Tab {
        case status, friends, settings
    }

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {

                // MARK: - Top Tabs
                HStack {
                    TabButton(title: "Status", isSelected: selectedTab == .status)
                        .onTapGesture { selectedTab = .status }

                    TabButton(title: "Friends", isSelected: selectedTab == .friends)
                        .onTapGesture { selectedTab = .friends }

                    TabButton(title: "Settings", isSelected: selectedTab == .settings)
                        .onTapGesture { selectedTab = .settings }
                }
                .padding(.horizontal)
                .padding(.top, 8)

                Divider().opacity(0.3)

                // MARK: - Content
                Group {
                    switch selectedTab {

                    case .status:
                        ScrollView {
                            VStack(alignment: .leading, spacing: 24) {
                                ForEach(FriendStatus.allCases) { status in
                                    if !vm.friends(for: status).isEmpty {
                                        StatusSection(
                                            title: status.rawValue,
                                            friends: vm.friends(for: status),
                                            status: status
                                        )
                                    }
                                }
                            }
                            .padding()
                        }

                    case .friends:
                        FriendsTabView()

                    case .settings:
                       // SettingsView()
                        SettingsView()
                    }
                }
                .animation(.easeInOut, value: selectedTab)
            }
            .background(Color(.systemBackground))
            .navigationTitle("Friends")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        // add friend
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    FriendsDashboardView()
}
   

