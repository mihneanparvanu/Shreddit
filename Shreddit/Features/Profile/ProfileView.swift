//
//  ProfileView.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 14.07.2025.
//

import SwiftUI

struct ProfileView: View {
    // MARK: Dependencies

    let user: User

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    header
                }
                .listRowBackground(Color.clear)

                ProfileSections()
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

private extension ProfileView {
    var header: some View {
        VStack {
            ProfilePicture(picture: user.image, size: 120)

            Text(user.username)
                .font(.subheadline)
                .foregroundStyle(.gray)
        }
        .frame(maxWidth: .infinity)
    }
}

private extension ProfileView {
    struct ProfileSections: View {
        let settingsRow = Row(title: "Settings", iconName: "gear")
        let profileRow = Row(title: "Profile", iconName: "person")

        var body: some View {
            Group {
                Section("Personalize".uppercased()) {
                    NavigationLink(destination: EmptyView()) {
                        profileRow.label
                    }
                }

                Section(settingsRow.uppercasedTitle) {
                    NavigationLink(destination: SettingsView()) {
                        settingsRow.label
                    }
                }
            }
            .accentColor(.gray)
        }
    }

    struct Row {
        private let title: String
        private let iconName: String

        var uppercasedTitle: String {
            title.uppercased()
        }

        var label: some View {
            Label(title, systemImage: iconName)
        }

        init(title: String, iconName: String) {
            self.title = title
            self.iconName = iconName
        }
    }
}

#Preview {
    ProfileView(user: DevPreview.Users.main)
        .environment(AppSettingsManager())
}
