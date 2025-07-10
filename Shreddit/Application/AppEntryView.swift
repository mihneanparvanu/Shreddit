//
//  AppEntryView.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 08.07.2025.
//

import SwiftUI

struct AppEntryView: View {
	@Environment(AppSettingsManager.self) var settingsManager
	@Environment(AppOnboardingManager.self) var onboardingManager
	@Environment(\.colorScheme) var systemScheme
	var body: some View {
		if onboardingManager.state.hasOnboarded  {
				DashboardView()
			} else {
				OnboardingView(onboardingManager: onboardingManager, settingsManager: settingsManager)
			}
	}
}

#Preview {
	AppEntryView()
		.environment(AppSettingsManager())
}
