//
//  UserStatus.swift
//  alertzzz
//
//  Created by Varun Sharma on 11/12/25.
//


enum UserStatus: String, CaseIterable, Identifiable {
    case free = "Free"
    case working = "Working"
    case sleeping = "Sleeping"

    var id: String { rawValue }

    var icon: String {
        switch self {
        case .free: return "face.smiling"
        case .working: return "briefcase"
        case .sleeping: return "moon"
        }
    }
}

extension UserStatus {
    var statusLine: String {
        switch self {
        case .free: return "Currently Free"
        case .working: return "Currently Working"
        case .sleeping: return "Currently Sleeping"
        }
    }

    var statusEmoji: String {
        switch self {
        case .free: return "😊"
        case .working: return "💼"
        case .sleeping: return "🌙"
        }
    }
}
