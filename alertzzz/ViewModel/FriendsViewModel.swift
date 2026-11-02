//
//  FriendFilter.swift
//  alertzzz
//
//  Created by Varun Sharma on 13/12/25.
//


import Observation

enum FriendFilter {
    case all, favorites, close
}

@Observable
final class FriendsViewModel {

    var searchText: String = ""
        var selectedFilter: FriendCategory = .all

    var friends: [Friend] = [
        Friend(name: "Ethan", status: .free),
        Friend(name: "James", status: .sleeping),
        Friend(name: "Liam", status: .free),
        Friend(name: "Noah", status: .working),
        Friend(name: "William", status: .sleeping)
    ]

    var filteredFriends: [Friend] {
        friends
            .filter {
                searchText.isEmpty ||
                $0.name.lowercased().contains(searchText.lowercased())
            }
            .filter {
                switch selectedFilter {
                case .all: return true
                case .favorites: return $0.isFavorite
                case .close: return $0.isCloseFriend
                }
            }
    }

    var groupedFriends: [String: [Friend]] {
        Dictionary(grouping: filteredFriends) {
            String($0.name.prefix(1))
        }
    }
}
