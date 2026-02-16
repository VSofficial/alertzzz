//
//  FriendsDashboardViewModel.swift
//  alertzzz
//
//  Created by Varun Sharma on 13/12/25.
//


import Observation

//@Observable
//class FriendsDashboardViewModel {
//
//    var friends: [Friend] = [
//        .init(name: "Ethan", status: .free),
//        .init(name: "Liam", status: .free),
//        .init(name: "Noah", status: .working),
//        .init(name: "James", status: .sleeping),
//        .init(name: "William", status: .sleeping),
//        .init(name: "Varun", status: .sleeping)
//    ]
//
//    func friends(for status: FriendStatus) -> [Friend] {
//        friends.filter { $0.status == status }
//    }
//    
//    
//}

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

    func friends(for status: FriendStatus) -> [Friend] {
        friends.filter { $0.status == status }
    }
}
