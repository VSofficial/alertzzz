//
//  SetStatusView.swift
//  alertzzz
//
//  Created by Varun Sharma on 11/12/25.
//


import SwiftUI
struct SetStatusView: View {

    @State private var vm = SetStatusViewModel()

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 28) {

                    // MARK: - Profile Section
                    HStack(spacing: 16) {
//                        Image("profile")                // <-- your image name
//                            .resizable()
//                            .scaledToFill()
//                            .frame(width: 72, height: 72)
//                            .clipShape(Circle())
                        
                        Text("🧑‍💻")                // <— Dummy Avatar Emoji
                                .font(.system(size: 48))
                                .frame(width: 72, height: 72)
                                .background(Color(.secondarySystemBackground))
                                .clipShape(Circle())

                        VStack(alignment: .leading, spacing: 4) {
                            Text("Alex Morgan")
                                .font(.title3.bold())
                                .foregroundStyle(.primary)

                            HStack(spacing: 6) {
                                Text(vm.selectedStatus.statusEmoji)
                                Text(vm.selectedStatus.statusLine)
                            }
                            .font(.subheadline)
                            .foregroundStyle(.green)
                        }

                        Spacer()
                    }
                    .padding(.top, 8)

                    // MARK: - Section Title
                    Text("What's your status?")
                        .font(.title3.bold())

                    // MARK: - Status Cards
                    VStack(spacing: 12) {
                        ForEach(UserStatus.allCases) { status in
                            StatusOptionCard(
                                status: status,
                                isSelected: vm.selectedStatus == status
                            )
                            .onTapGesture {
                                withAnimation(.snappy) {
                                    vm.selectedStatus = status
                                }
                            }
                        }
                    }

                    // MARK: - Message Section
                    Text("Add a message")
                        .font(.title3.bold())
                        .padding(.top, 8)

                    HStack {
                        TextField("What are you up to?", text: $vm.message)
                        Image(systemName: "face.smiling")
                            .foregroundStyle(.secondary)
                    }
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .clipShape(RoundedRectangle(cornerRadius: 12))

                }
                .padding(.horizontal)
            }
            .navigationTitle("Set Status")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        // dismiss action
                    } label: {
                        Image(systemName: "xmark")
                            .foregroundStyle(.primary)
                    }
                }
            }
        }
    }
}

#Preview("Dark Mode") {
    SetStatusView()
        .environment(\.colorScheme, .dark)
}


//#Preview {
//    SetStatusView()
//}
