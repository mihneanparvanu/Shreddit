//
//  AppEntryView.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 08.07.2025.
//

import SwiftUI

struct AppEntryView: View {
	@Environment(SettingsManager.self) var settingsManager
	@Environment(OnboardingManager.self) var onboardingManager
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
		.environment(SettingsManager())
}
