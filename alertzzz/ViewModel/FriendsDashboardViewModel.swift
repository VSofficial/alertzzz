//
//  FriendsDashboardViewModel.swift
//  alertzzz
//
//  Created by Varun Sharma on 13/12/25.
//


import Observation
import Foundation
import WidgetKit



@Observable
class FriendsDashboardViewModel {

    var myProfile: Friend = .init(name: "Varun", status: .sleeping)

    var friends: [Friend] = [
        .init(name: "Ethan", status: .free),
        .init(name: "Liam", status: .free),
        .init(name: "Noah", status: .working),
        .init(name: "James", status: .sleeping),
        .init(name: "William", status: .sleeping)
    ]
    
    func updateMyStatus(to newStatus: FriendStatus) {
            // 1️⃣ Update local state
            myProfile.status = newStatus

            // 2️⃣ Save to App Group
            let defaults = UserDefaults(suiteName: "group.com.alertzzz")
            defaults?.set(newStatus.rawValue, forKey: "myStatus")

            // 3️⃣ Tell widget to refresh
            WidgetCenter.shared.reloadAllTimelines()
        }
    
    func friends(for status: FriendStatus) -> [Friend] {
        friends.filter { $0.status == status }
    }
}
