//
//  alertzzzApp.swift
//  alertzzz
//
//  Created by Varun Sharma on 21/11/25.
//

import SwiftUI

@main
struct alertzzzApp: App {

    @State private var appState = AppState()

    var body: some Scene {
        WindowGroup {
//            FriendsDashboardView()
//                .environment(appState)
            SetStatusView()
                .environment(appState)
        }
    }
}

//@main
//struct alertzzzApp: App {
//    var body: some Scene {
//        WindowGroup {
//            ContentView()
//        }
//    }
//}
