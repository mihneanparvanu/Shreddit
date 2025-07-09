//
//  AppEntryView.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 08.07.2025.
//

import SwiftUI

struct AppEntryView: View {
	@Environment(DefaultSettingsManager.self) var settingsManager
	@Environment(\.colorScheme) var systemScheme
	var body: some View {
			if settingsManager.settings.hasOnboarded  {
				DashboardView()
			} else {
				OnboardingView(settingsManager: settingsManager)
			}
	}
}

#Preview {
	AppEntryView()
		.environment(DefaultSettingsManager())
}
