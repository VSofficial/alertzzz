//
//  FriendStatus.swift
//  alertzzz
//
//  Created by Varun Sharma on 13/12/25.
//

import SwiftUI
import Foundation
import Observation

@Observable
final class Friend: Identifiable {

    let id = UUID()

    var name: String
    var status: FriendStatus
    var isFavorite: Bool
    var isCloseFriend: Bool

    init(
        name: String,
        status: FriendStatus,
        isFavorite: Bool = false,
        isCloseFriend: Bool = false
    ) {
        self.name = name
        self.status = status
        self.isFavorite = isFavorite
        self.isCloseFriend = isCloseFriend
    }
}

enum FriendStatus: String, CaseIterable, Identifiable {
    case free = "Free"
    case working = "Working"
    case sleeping = "Sleeping"

    var id: String { rawValue }

    var emoji: String {
        switch self {
        case .free: return "face.smiling"
        case .working: return "briefcase.fill"
        case .sleeping: return "bed.double.fill"
        }
    }

    var color: Color {
        switch self {
        case .free: return .green
        case .working: return .orange
        case .sleeping: return .blue
        }
    }
}
