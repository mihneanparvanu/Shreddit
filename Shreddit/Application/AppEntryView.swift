//
//  AppEntryView.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 08.07.2025.
//

import SwiftUI

struct AppEntryView: View {
    // MARK: Dependencies

    let healthManager: HealthManager
    let user: User

    // MARK: Environment

    @Environment(AppSettingsManager.self) var settingsManager
    @Environment(AppOnboardingManager.self) var onboardingManager
    @Environment(\.colorScheme) var systemScheme

    var body: some View {
        Group {
            if onboardingManager.state.hasOnboarded {
                DashboardView(
                    healthManager: healthManager,
                    user: user
                )
            } else {
                OnboardingView(onboardingManager: onboardingManager,
                               settingsManager: settingsManager,
                               healthManager: healthManager)
            }
        }
        .colorScheme(settingsManager.settings.appearance.colorScheme ?? systemScheme)
    }
}

#Preview {
    AppEntryView(healthManager: HealthManager(),
                 user: User.preview)
        .environment(AppSettingsManager())
}
