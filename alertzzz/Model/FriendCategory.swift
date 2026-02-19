//
//  FriendCategory.swift
//  alertzzz
//
//  Created by Varun Sharma on 13/12/25.
//


import Foundation

enum FriendCategory: CaseIterable, Identifiable {
    case all
    case favorites
    case close

    var id: Self { self }
}