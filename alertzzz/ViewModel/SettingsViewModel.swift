//
//  SettingsViewModel.swift
//  alertzzz
//
//  Created by Varun Sharma on 13/12/25.
//


import Observation

@Observable
final class SettingsViewModel {

    // Profile
    var name: String = "Ethan"
    var email: String = "ethan_w@example.com"

    // Preferences
    var isDarkMode: Bool = true
    var soundsEnabled: Bool = true

    // Privacy
    var ghostModeEnabled: Bool = false

    // Actions
    func logout() {
        print("User logged out")
    }
}