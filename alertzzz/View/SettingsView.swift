//
//  SettingsView.swift
//  alertzzz
//
//  Created by Varun Sharma on 13/12/25.
//


import SwiftUI

struct SettingsView: View {

    @State private var vm = SettingsViewModel()

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {

                // MARK: - Profile
                ProfileCard(
                    name: vm.name,
                    email: vm.email
                )

                // MARK: - Preferences
                SettingsSection(title: "PREFERENCES") {
                    ToggleRow(
                        icon: "moon.fill",
                        iconColor: .indigo,
                        title: "Dark Mode",
                        isOn: $vm.isDarkMode
                    )

                    NavigationRow(
                        icon: "bell.fill",
                        iconColor: .orange,
                        title: "Notifications"
                    )

                    ToggleRow(
                        icon: "speaker.wave.2.fill",
                        iconColor: .blue,
                        title: "Sounds",
                        isOn: $vm.soundsEnabled
                    )
                }

                // MARK: - Privacy & Security
                SettingsSection(title: "PRIVACY & SECURITY") {
                    ToggleRow(
                        icon: "eye.slash.fill",
                        iconColor: .gray,
                        title: "Ghost Mode",
                        subtitle: "Hide status from everyone",
                        isOn: $vm.ghostModeEnabled
                    )

                    NavigationRow(
                        icon: "nosign",
                        iconColor: .red,
                        title: "Blocked Users"
                    )
                }

                // MARK: - Support
                SettingsSection(title: "SUPPORT") {
                    NavigationRow(
                        icon: "questionmark.circle.fill",
                        iconColor: .green,
                        title: "Help Center",
                        external: true
                    )

                    Button {
                        vm.logout()
                    } label: {
                        HStack {
                            Image(systemName: "arrow.backward.square.fill")
                            Text("Log Out")
                        }
                        .foregroundStyle(.red)
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }

                Text("Version 2.4.0 (Build 1084)")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
                    .padding(.top, 8)
            }
            .padding()
        }
        .navigationTitle("Settings")
        .navigationBarTitleDisplayMode(.inline)
    }
}