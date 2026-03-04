//
//  BaseHelper.swift
//  alertzzz
//
//  Created by Varun Sharma on 01/12/25.
//
import SwiftUI

struct StatusOptionCard: View {
    let status: FriendStatus
    let isSelected: Bool

    var body: some View {
        HStack(spacing: 14) {
            Image(systemName: status.emoji)
                .font(.title3)
                .foregroundStyle(isSelected ? .white : .primary)

            Text(status.rawValue)
                .font(.body)
                .foregroundStyle(isSelected ? .white : .primary)

            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 14)
                .fill(
                    isSelected
                    ? Color.blue
                    : Color(.secondarySystemBackground)
                )
        )
        .overlay(
            RoundedRectangle(cornerRadius: 14)
                .stroke(isSelected ? .blue : .clear, lineWidth: 2)
        )
        .animation(.snappy, value: isSelected)
    }
}

struct StatusSelfSection: View {
    let title: String
    let friends: [Friend]
    let status: FriendStatus

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(.headline)
                .foregroundStyle(.primary)

            ForEach(friends) { friend in
                SelfRow(friend: friend)
            }
        }
    }
}

struct StatusSection: View {
    let title: String
    let friends: [Friend]
    let status: FriendStatus

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(.headline)
                .foregroundStyle(.primary)

            ForEach(friends) { friend in
                FriendRow(friend: friend)
            }
        }
    }
}

//struct FriendRow: View {
//    let friend: Friend
//
//    var body: some View {
//        HStack(spacing: 14) {
//
//            // Avatar Emoji
//            Text(friend.status.emoji)
//                .font(.system(size: 28))
//                .frame(width: 48, height: 48)
//                .background(Color(.secondarySystemBackground))
//                .clipShape(Circle())
//
//            VStack(alignment: .leading, spacing: 4) {
//                Text(friend.name)
//                    .font(.headline)
//
//                Text(friend.status.rawValue)
//                    .font(.subheadline)
//                    .foregroundStyle(friend.status.color)
//            }
//
//            Spacer()
//
//            // Actions
//            if friend.status != .sleeping {
//                ActionButton(systemName: "message.fill")
//                ActionButton(systemName: "phone.fill")
//            }
//        }
//        .padding()
//        .background(Color(.secondarySystemBackground))
//        .clipShape(RoundedRectangle(cornerRadius: 16))
//    }
//}

struct TabButton: View {
    let title: String
    let isSelected: Bool

    var body: some View {
        VStack(spacing: 6) {
            Text(title)
                .font(.subheadline.bold())
                .foregroundStyle(isSelected ? .blue : .gray)

            Rectangle()
                .fill(isSelected ? Color.blue : .clear)
                .frame(height: 2)
        }
        .frame(maxWidth: .infinity)
    }
}


struct ActionButton: View {
    let systemName: String

    var body: some View {
        Image(systemName: systemName)
            .foregroundStyle(.blue)
            .frame(width: 36, height: 36)
            .background(Color(.systemBackground))
            .clipShape(Circle())
    }
}

struct FriendRow: View {

    let friend: Friend

    var body: some View {
        HStack(spacing: 14) {

            // Avatar
            ZStack(alignment: .bottomTrailing) {
                Text(friend.status.emoji)
                    .font(.system(size: 26))
                    .frame(width: 48, height: 48)
                    .background(Color(.secondarySystemBackground))
                    .clipShape(Circle())

                Circle()
                    .fill(friend.status.color)
                    .frame(width: 10, height: 10)
            }

            VStack(alignment: .leading, spacing: 4) {
                Text(friend.name)
                    .font(.headline)

                Text(friend.status.rawValue)
                    .font(.subheadline)
                    .foregroundStyle(friend.status.color)
            }

            Spacer()

            if friend.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundStyle(.yellow)
            }

            Image(systemName: "chevron.right")
                .foregroundStyle(.secondary)
        }
        .padding()
        .background(Color(.secondarySystemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

struct SelfRow: View {

    let friend: Friend

    
    var body: some View {
        if friend.name == "Varun" {
            HStack(spacing: 14) {

                // Avatar
                ZStack(alignment: .bottomTrailing) {
                    Text(friend.status.emoji)
                        .font(.system(size: 26))
                        .frame(width: 48, height: 48)
                        .background(Color(.secondarySystemBackground))
                        .clipShape(Circle())

                    Circle()
                        .fill(friend.status.color)
                        .frame(width: 10, height: 10)
                }

                VStack(alignment: .leading, spacing: 4) {
                    Text(friend.name)
                        .font(.headline)

                    Text(friend.status.rawValue)
                        .font(.subheadline)
                        .foregroundStyle(friend.status.color)
                }

                Spacer()

                if friend.isFavorite {
                    Image(systemName: "star.fill")
                        .foregroundStyle(.yellow)
                }

                Image(systemName: "chevron.right")
                    .foregroundStyle(.secondary)
            }
            .padding()
            .background(Color(.secondarySystemBackground))
            .clipShape(RoundedRectangle(cornerRadius: 16))
        }
      
    }
}

struct SearchBar: View {
    @Binding var text: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: "magnifyingglass")
                .foregroundStyle(.secondary)

            TextField("Search friends", text: $text)
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)

            if !text.isEmpty {
                Button {
                    text = ""
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundStyle(.secondary)
                }
            }
        }
        .padding(.horizontal, 14)
        .padding(.vertical, 10)
        .background(Color(.secondarySystemBackground))
        .clipShape(Capsule())
        .overlay(
            Capsule()
                .stroke(Color.white.opacity(0.06))
        )
    }
}

struct FilterChips: View {

    @Binding var selected: FriendCategory

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                Chip("All Friends", .all, selected: $selected)
                Chip("Favorites", .favorites, selected: $selected)
                Chip("Close Friends", .close, selected: $selected)
            }
            .padding(.vertical, 4)
        }
    }
}

struct Chip: View {
    let title: String
    let value: FriendCategory
    @Binding var selected: FriendCategory

    init(_ title: String, _ value: FriendCategory, selected: Binding<FriendCategory>) {
        self.title = title
        self.value = value
        self._selected = selected
    }

    var body: some View {
        Text(title)
            .font(.subheadline.weight(.medium))
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .background(
                Capsule()
                    .fill(
                        selected == value
                        ? Color.blue
                        : Color(.secondarySystemBackground)
                    )
            )
            .foregroundStyle(
                selected == value ? .white : .secondary
            )
            .overlay(
                Capsule()
                    .stroke(
                        Color.white.opacity(selected == value ? 0 : 0.06)
                    )
            )
            .contentShape(Capsule())
            .onTapGesture {
                withAnimation(.easeInOut(duration: 0.15)) {
                    selected = value
                }
            }
    }
}

struct ProfileCard: View {

    let name: String
    let email: String

    var body: some View {
        HStack(spacing: 14) {

            Text("👤")
                .font(.system(size: 34))
                .frame(width: 54, height: 54)
                .background(Color(.secondarySystemBackground))
                .clipShape(Circle())

            VStack(alignment: .leading, spacing: 4) {
                Text(name)
                    .font(.headline)
                Text(email)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }

            Spacer()

            Button("Edit") {}
                .font(.subheadline)
                .padding(.horizontal, 14)
                .padding(.vertical, 6)
                .background(Color.blue.opacity(0.15))
                .clipShape(Capsule())
        }
        .padding()
        .background(Color(.secondarySystemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 18))
    }
}

struct SettingsSection<Content: View>: View {

    let title: String
    let content: Content

    init(title: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(.caption)
                .foregroundStyle(.secondary)

            VStack(spacing: 0) {
                content
            }
            .background(Color(.secondarySystemBackground))
            .clipShape(RoundedRectangle(cornerRadius: 18))
        }
    }
}

struct ToggleRow: View {

    let icon: String
    let iconColor: Color
    let title: String
    var subtitle: String? = nil
    @Binding var isOn: Bool

    var body: some View {
        Toggle(isOn: $isOn) {
            HStack(spacing: 12) {
                Image(systemName: icon)
                    .foregroundStyle(iconColor)
                    .frame(width: 28)

                VStack(alignment: .leading) {
                    Text(title)
                    if let subtitle {
                        Text(subtitle)
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                }
            }
        }
        .padding()
    }
}

struct NavigationRow: View {

    let icon: String
    let iconColor: Color
    let title: String
    var external: Bool = false

    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundStyle(iconColor)
                .frame(width: 28)

            Text(title)

            Spacer()

            Image(systemName: external ? "arrow.up.right.square" : "chevron.right")
                .foregroundStyle(.secondary)
        }
        .padding()
    }
}



