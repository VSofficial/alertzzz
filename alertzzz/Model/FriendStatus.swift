//
//  FriendStatus.swift
//  alertzzz
//
//  Created by Varun Sharma on 13/12/25.
//

import SwiftUI

enum FriendStatus: String, CaseIterable, Identifiable {
    case free = "Free"
    case working = "Working"
    case sleeping = "Sleeping"

    var id: String { rawValue }

    var color: Color {
        switch self {
        case .free: return .green
        case .working: return .orange
        case .sleeping: return .blue
        }
    }

    var emoji: String {
        switch self {
        case .free: return "😊"
        case .working: return "💼"
        case .sleeping: return "🌙"
        }
    }
}

struct Friend: Identifiable {
    let id = UUID()
    let name: String
    let status: FriendStatus
}

extension Friend {
    var isFavorite: Bool {
        ["Ethan", "William"].contains(name)
    }

    var isCloseFriend: Bool {
        ["James"].contains(name)
    }
}
