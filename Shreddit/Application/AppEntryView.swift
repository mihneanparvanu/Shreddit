//
//  AppEntryView.swift
//  Shreddit
//
//  Created by Mihnea Nicolae Pârvanu on 08.07.2025.
//

import SwiftUI

struct AppEntryView: View {
	@Environment(SettingsManager.self) var settingsManager
	@Environment(\.colorScheme) var systemScheme
	var body: some View {
		if settingsManager.preferences.hasOnboarded  {
				DashboardView()
			} else {
				OnboardingView(settingsManager: settingsManager)
			}
	}
}

#Preview {
	AppEntryView()
		.environment(SettingsManager())
}
