//
//  StatusType.swift
//  alertzzz
//
//  Created by Varun Sharma on 24/02/26.
//


import SwiftUI

enum StatusType: String, CaseIterable, Identifiable {
    case free = "Free"
    case working = "Working"
    case sleeping = "Sleeping"

    var id: String { rawValue }

    // Shared UI logic
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

    var icon: String {
        switch self {
        case .free: return "face.smiling"
        case .working: return "briefcase"
        case .sleeping: return "moon"
        }
    }

    var statusLine: String {
        switch self {
        case .free: return "Currently Free"
        case .working: return "Currently Working"
        case .sleeping: return "Currently Sleeping"
        }
    }
}