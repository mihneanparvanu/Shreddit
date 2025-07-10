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
	let healthManager: HealthManager
	@Environment(\.colorScheme) var systemScheme
	var body: some View {
		if onboardingManager.state.hasOnboarded  {
				DashboardView()
			} else {
				OnboardingView(onboardingManager: onboardingManager,
							   settingsManager: settingsManager,
							   healthManager: healthManager
							   
				)
			}
	}
}

#Preview {
	AppEntryView(healthManager: HealthManager())
		.environment(AppSettingsManager())
}
