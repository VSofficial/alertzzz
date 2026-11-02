//
//  AppState.swift
//  alertzzz
//
//  Created by Varun Sharma on 13/12/25.
//


import Observation

@Observable
final class AppState {

    // MARK: - User
    var currentUserName: String = "Ethan"
    var currentUserEmail: String = "ethan_w@example.com"
    var currentStatus: FriendStatus = .free
    var statusMessage: String = ""

    // MARK: - Friends
    var friends: [Friend] = [
        Friend(name: "Ethan", status: .free),
        Friend(name: "James", status: .sleeping),
        Friend(name: "Liam", status: .free),
        Friend(name: "Noah", status: .working),
        Friend(name: "William", status: .sleeping)
    ]

    // MARK: - Settings
    var darkModeEnabled: Bool = true
    var soundsEnabled: Bool = true
    var ghostModeEnabled: Bool = false
}