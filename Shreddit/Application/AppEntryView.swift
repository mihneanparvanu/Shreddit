//
//  AppEntryView.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 08.07.2025.
//

import SwiftUI

struct AppEntryView: View {
	//MARK: Dependencies
	let healthManager: HealthManager
	
	//MARK: Environment
	@Environment(AppSettingsManager.self) var settingsManager
	@Environment(AppOnboardingManager.self) var onboardingManager
	@Environment(\.colorScheme) var systemScheme
	
	var body: some View {
		Group {
			if onboardingManager.state.hasOnboarded  {
				DashboardView()
			} else {
				OnboardingView(onboardingManager: onboardingManager,
							   settingsManager: settingsManager,
							   healthManager: healthManager
							   
				)
			}
		}
		.colorScheme(settingsManager.settings.appearance.colorScheme ?? systemScheme)
	}
}

#Preview {
	AppEntryView(healthManager: HealthManager())
		.environment(AppSettingsManager())
}
