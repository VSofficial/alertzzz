//
//  SetStatusView.swift
//  alertzzz
//
//  Created by Varun Sharma on 11/12/25.
//

import SwiftUI

struct SetStatusView: View {

    @Environment(AppState.self) private var appState

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 28) {

                    Text("What's your status?")
                        .font(.title3.bold())

                    VStack(spacing: 12) {
                        ForEach(FriendStatus.allCases) { status in
                            StatusOptionCard(
                                status: status,
                                isSelected: appState.currentSelf.status == status
                            )
                            .onTapGesture {
                                withAnimation(.snappy) {
                                    appState.currentSelf.status = status
                                }
                            }
                        }
                    }

                    Text("Add a message")
                        .font(.title3.bold())
                        .padding(.top, 8)

                    TextField(
                        "What are you up to?",
                        text: Binding(
                            get: { appState.statusMessage },
                            set: { appState.statusMessage = $0 }
                        )
                    )
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                }
                .padding()
            }
            .navigationTitle("Set Status")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}


#Preview("Dark Mode") {
    SetStatusView()
        .environment(\.colorScheme, .dark)
        .environment(AppState())
}


//#Preview {
//    SetStatusView()
//}
