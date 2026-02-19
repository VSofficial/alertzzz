//
//  SetStatusViewModel.swift
//  alertzzz
//
//  Created by Varun Sharma on 11/12/25.
//


import Observation

@Observable
class SetStatusViewModel {
    var selectedStatus: UserStatus = .free
    var message: String = ""
}