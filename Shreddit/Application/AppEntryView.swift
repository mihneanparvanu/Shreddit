//
//  AppEntryView.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 08.07.2025.
//

import SwiftUI

struct AppEntryView: View {
    // MARK: Dependencies

    // MARK: Environment

	@Environment(HealthManager.self) var healthManager
    @Environment(AppSettingsManager.self) var settingsManager
    @Environment(AppOnboardingManager.self) var onboardingManager
    @Environment(\.colorScheme) var systemScheme

    var body: some View {
        Group {
            if onboardingManager.state.hasOnboarded {
				DashboardView(healthManager: healthManager)
            } else {
                OnboardingView(onboardingManager: onboardingManager)
            }
        }
        .colorScheme(settingsManager.settings.appearance.colorScheme ?? systemScheme)
    }
}

#Preview {
    AppEntryView()
	.previewEnvironment()
}
